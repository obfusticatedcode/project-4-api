class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :update, :destroy, :upvote, :downvote]
  skip_before_action :authenticate_user!, only: [:index, :show]

  # GET /products
  def index
    @products = Product.all.order(:cached_votes_score => :desc)

    render json: @products
  end

  # GET /products/1
  def show
    render json: @product
  end

  # POST /products
  def create
    @product = Product.new(Uploader.upload(product_params))
    @product.user = current_user

    if @product.save
      render json: @product, status: :created, location: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /products/1
  def update
    if @product.update(Uploader.upload(product_params))
      render json: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # DELETE /products/1
  def destroy
    return render json: { errors: ["Unauthorized"] } if @product.user != current_user
    @product.destroy
  end

  # PUT /products/1/upvote
  # acts_as_votable methods
  # upvote and down vote from user
  def upvote
    @product.upvote_from current_user
    render json: @product #this returns the live votes to the page
  end

  # PUT /products/1/downvote
  def downvote
    @product.downvote_from current_user
    render json: @product #this returns the live votes to the page
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id]) #this is causing a bug on the create new route.
    end

    # Only allow a trusted parameter "white list" through.
    def product_params
      params.permit(:name, :category, :image, :base64, :view_count, :user_id, loved_by_ids: [])
    end
end

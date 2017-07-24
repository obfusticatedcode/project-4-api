class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]
  
  # GET /products
  def index
    @products = Product.all

    render json: @products
  end

  # GET /products/1
  def show
    render json: @product
  end

  # POST /products
  def create
    @product = Product.new(Uploader.upload(product_params))
    @product = Product.new(product_params)
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def product_params
      params.permit(:name, :category, :image, :base64,:view_count, :user_id,loved_by_ids: [])
    end
end

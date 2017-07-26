class FeaturesController < ApplicationController
  before_action :set_feature, only: [:show, :update, :destroy, :upvote, :downvote]

  # GET /features
  def index
    @features = Feature.all.order(:cached_votes_score => :desc)

    render json: @features
  end

  # GET /features/1
  def show
    render json: @feature
  end

  # POST /features
  def create
    @feature = Feature.new(Uploader.upload(feature_params))

    @feature.user = current_user

    if @feature.save
      render json: @feature, status: :created, location: @feature
    else
      render json: @feature.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /features/1
  def update
    if @feature.update(feature_params)
      render json: @feature
    else
      render json: @feature.errors, status: :unprocessable_entity
    end
  end

  # DELETE /features/1
  def destroy
    return render json: { errors: ["Unauthorized"] } if @feature.user != current_user
    @feature.destroy
  end

  # acts_as_votable methods
  # upvote and down vote from user
  def upvote
    @feature.upvote_from current_user
    return render json: @feature
  end

  def downvote
    @feature.downvote_from current_user
    return render json: @feature
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feature
      @feature = Feature.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def feature_params
      params.permit(:title, :description, :image, :base64,:user_id, :product_id, loved_by_ids: [])
    end
end

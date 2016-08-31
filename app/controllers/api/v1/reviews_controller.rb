class Api::V1::ReviewsController < Api::V1::BaseController
  def index
    # debugger
    # respond_with (Category.first.as_json(include:[:films]))
    respond_with (Film.find_by(id:  params[:film_id]).reviews.to_json(include: :user))
  end

  def show
    # Film.find_by(id: params[:id]).to_json(include: :reviews)
    respond_with (Film.find_by(id: params[:id]))
  end

  def create

    moview = Film.find_by(id: params[:film_id])
    review = moview.reviews.new(review_params)
    if review.save
      render json: (review.to_json(include: :user))
    else
      render json: (review.errors)
    end
  end

  private
    def review_params
      params[:review][:film_id] = params[:film_id]
      params.require(:review).permit(:content, :rating, :film_id, :user_id)
    end
end

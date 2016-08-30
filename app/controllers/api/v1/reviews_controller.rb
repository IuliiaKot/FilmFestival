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
end

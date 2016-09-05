class Api::V1::FilmsController < Api::V1::BaseController
  def index
    # debugger
    # respond_with (Category.first.as_json(include:[:films]))
    respond_with (Film.all.to_json(include: :categories))
  end

  def show
    # Film.find_by(id: params[:id]).to_json(include: :reviews)
    respond_with (Film.find_by(id: params[:id]))
  end
end

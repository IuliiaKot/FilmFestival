class Api::V1::CategoriesController < Api::V1::BaseController
  def index
    respond_with (Category.all)
  end


  def show
    # debugger
    respond_with (Category.find_by(id: params[:id]).films.to_json(include: :categories))
  end
end

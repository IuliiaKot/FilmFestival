class Api::V1::CategoriesController < Api::V1::BaseController
  def index
    respond_with (Category.all)
  end


  def show
    respond_with (Category.find_by(id: params[:id]).as_json(include: :films))
  end
end

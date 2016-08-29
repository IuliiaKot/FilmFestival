class Api::V1::CategoriesController < Api::V1::BaseController
  def index
    cat = Category
    respond_with (Category.all)
  end
end

class Api::V1::FilmsController < Api::V1::BaseController
  def index
    # debugger
    # respond_with (Category.first.as_json(include:[:films]))
    respond_with (Film.all.to_json(include: :category))
  end
end

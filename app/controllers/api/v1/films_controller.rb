class Api::V1::FilmsController < Api::V1::BaseController
  def index
    debugger
    respond_with Film.all
  end
end

module V1
  class LinesController < ApiController
    respond_to :json

    def show
      @line = Line.find_by_line_index(params[:line])
      render json: @line
    end
  end
end
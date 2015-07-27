module V1
  class LinesController < ApiController
    respond_to :json

    def show
      @line = Line.find_by_line_index(params[:line])
      if @line
        render json: { line_text: @line.line_text }
      else
        render json: { message: "Requested line doesn't exist or is beyond the end of the file." }, status: 413
      end
    end
  end
end
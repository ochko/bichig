class OtfFilesController < ApplicationController
  def show
    @font = OpenTypeFont.find(params[:open_type_font_id])
    @file = OtfFile.find(params[:id])
    render :layout => false
  end

  def index
    @font = OpenTypeFont.find(params[:open_type_font_id])
    @files = @font.files
    render :layout => false
  end

  def update
    @font = OpenTypeFont.find(params[:open_type_font_id])
    @file = OtfFile.find(params[:id])
    @file.render_examples!
    respond_to do |format|
      format.html { redirect_to [@font, @file] }
      format.js do
        @index = @font.files.index(@file)
      end
    end

  end

end

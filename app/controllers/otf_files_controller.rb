class OtfFilesController < ApplicationController
  def show
    @file = OtfFile.find(params[:id])
  end

  def index
    @files = OtfFile.all
  end

end

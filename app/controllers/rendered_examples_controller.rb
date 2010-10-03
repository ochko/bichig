class RenderedExamplesController < ApplicationController
  def show
    @rendered = RenderedExample.find(params[:id])
    @file = @rendered.file
    @rendered.toggle_correctness!
    respond_to do |format|
      format.js
    end
  end
  
end

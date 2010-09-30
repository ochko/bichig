class OtfClassesController < ApplicationController
  # GET /otf_classes
  # GET /otf_classes.xml
  def index
    @font = OpenTypeFont.find(params[:open_type_font_id])
    @otf_classes = @font.classes.named(:include => :otf_glyphs)
    render :layout => false
  end

  def show
    if params[:id] =~ /^@/
      @otf_class = OtfClass.find_by_name(params[:id])
    else
      @otf_class = OtfClass.find(params[:id])
    end  

    respond_to do |format|
      format.html 
      format.js  
    end
  end

  def new
    @font = OpenTypeFont.find(params[:open_type_font_id])
    @otf_class = OtfClass.new
  end

  def edit
    @font = OpenTypeFont.find(params[:open_type_font_id])
    @otf_class = OtfClass.find(params[:id])
  end

  def create
    @font = OpenTypeFont.find(params[:open_type_font_id])
    @otf_class = @font.classes.build(params[:otf_class])

    if @otf_class.save
      expire_fragment('classes')
      redirect_to [@font, @otf_class], :notice => 'Otf class was successfully created.'
    else
      render :action => "new" 
    end
  end

  def update
    @font = OpenTypeFont.find(params[:open_type_font_id])
    @otf_class = OtfClass.find(params[:id])

    if @otf_class.update_attributes(params[:otf_class])
      expire_fragment('classes')
      redirect_to( [@font,@otf_class], :notice => 'Otf class was successfully updated.') 
    else
      render :action => "edit" 
    end
  end

  def destroy
    @otf_class = OtfClass.find(params[:id])
    @otf_class.destroy
    expire_fragment('classes')
    redirect_to @otf_class.open_type_font 
  end
end

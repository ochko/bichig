class OtfUnicodesController < ApplicationController
  before_filter :require_editor, :except => [:index, :show]

  def index
    @font = OpenTypeFont.find(params[:open_type_font_id])
    @otf_unicodes = @font.unicodes
    @otf_unicode = @font.unicodes.build
    render :layout => false 
  end

  # GET /otf_unicodes/1
  # GET /otf_unicodes/1.xml
  def show
    @font = OpenTypeFont.find(params[:open_type_font_id])
    @otf_unicode = OtfUnicode.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @otf_unicode }
    end
  end

  # GET /otf_unicodes/new
  # GET /otf_unicodes/new.xml
  def new
    @font = OpenTypeFont.find(params[:open_type_font_id])
    @otf_unicode = @font.unicodes.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @otf_unicode }
    end
  end

  # GET /otf_unicodes/1/edit
  def edit
    @font = OpenTypeFont.find(params[:open_type_font_id])
    @otf_unicode = OtfUnicode.find(params[:id])
    respond_to do |format|
      format.html
      format.js  
    end
  end

  # POST /otf_unicodes
  # POST /otf_unicodes.xml
  def create
    @font = OpenTypeFont.find(params[:open_type_font_id])
    @otf_unicode = @font.unicodes.build(params[:otf_unicode])

    respond_to do |format|
      if @otf_unicode.save
        format.html { redirect_to(@otf_unicode, :notice => 'Otf unicode was successfully created.') }
        format.js
      else
        format.html { render :action => "new" }
        format.js { render :text => "alert('Sorry. Can not save!');" }
      end
    end
  end

  # PUT /otf_unicodes/1
  # PUT /otf_unicodes/1.xml
  def update
    @font = OpenTypeFont.find(params[:open_type_font_id])
    @otf_unicode = OtfUnicode.find(params[:id])

    respond_to do |format|
      if @otf_unicode.update_attributes(params[:otf_unicode])
        format.html { redirect_to(@font, :notice => 'Otf unicode was successfully updated.') }
        format.js  
      else
        format.html { render :action => "edit" }
        format.js  
      end
    end
  end

  # DELETE /otf_unicodes/1
  # DELETE /otf_unicodes/1.xml
  def destroy
    @font = OpenTypeFont.find(params[:open_type_font_id])
    @otf_unicode = OtfUnicode.find(params[:id])
    @otf_unicode.destroy

    respond_to do |format|
      format.html { redirect_to @font }
      format.js
    end
  end
end

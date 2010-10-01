class OtfUnicodesController < ApplicationController

  def index
    @font = OpenTypeFont.find(params[:open_type_font_id])
    @otf_unicodes = @font.unicodes
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
    @otf_unicode = OtfUnicode.new(params[:otf_unicode])

    respond_to do |format|
      if @otf_unicode.save
        format.html { redirect_to(@otf_unicode, :notice => 'Otf unicode was successfully created.') }
        format.xml  { render :xml => @otf_unicode, :status => :created, :location => @otf_unicode }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @otf_unicode.errors, :status => :unprocessable_entity }
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
    @otf_unicode = OtfUnicode.find(params[:id])
    @otf_unicode.destroy

    respond_to do |format|
      format.html { redirect_to(otf_unicodes_url) }
      format.xml  { head :ok }
    end
  end
end

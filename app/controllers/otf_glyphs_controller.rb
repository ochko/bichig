class OtfGlyphsController < ApplicationController
  # GET /otf_glyphs
  # GET /otf_glyphs.xml
  def index
    @font = OpenTypeFont.find(params[:open_type_font_id])
    @otf_glyphs = @font.glyphs.order(:name)
    render :layout => false
  end

  # GET /otf_glyphs/1
  # GET /otf_glyphs/1.xml
  def show
    @font = OpenTypeFont.find(params[:open_type_font_id])
    @otf_glyph = OtfGlyph.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @otf_glyph }
    end
  end

  # GET /otf_glyphs/new
  # GET /otf_glyphs/new.xml
  def new
    @font = OpenTypeFont.find(params[:open_type_font_id])
    @otf_glyph = @font.glyphs.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @otf_glyph }
    end
  end

  # GET /otf_glyphs/1/edit
  def edit
    @font = OpenTypeFont.find(params[:open_type_font_id])
    @otf_glyph = OtfGlyph.find(params[:id])
  end

  # POST /otf_glyphs
  # POST /otf_glyphs.xml
  def create
    @font = OpenTypeFont.find(params[:open_type_font_id])
    @otf_glyph = @font.glyphs.build(params[:otf_glyph])

    if @otf_glyph.save
      FileUtils.cp @otf_glyph.image.path, 
      Rails.root.join('public/images/glyphs/', @otf_glyph.name + '.png')
      redirect_to(@font, :notice => 'Otf glyph was successfully created.')
    else
      render :action => "new"
    end
  end

  # PUT /otf_glyphs/1
  # PUT /otf_glyphs/1.xml
  def update
    @font = OpenTypeFont.find(params[:open_type_font_id])
    @otf_glyph = OtfGlyph.find(params[:id])

    if @otf_glyph.update_attributes(params[:otf_glyph])
      FileUtils.cp @otf_glyph.image.path, 
      Rails.root.join('public/images/glyphs/', @otf_glyph.name + '.png')
      redirect_to(@font, :notice => 'Otf glyph was successfully updated.')
    else
      render :action => "edit" 
    end
  end

  # DELETE /otf_glyphs/1
  # DELETE /otf_glyphs/1.xml
  def destroy
    @font = OpenTypeFont.find(params[:open_type_font_id])
    @otf_glyph = OtfGlyph.find(params[:id])
    if @otf_glyph.orphan?
      @otf_glyph.destroy
      redirect_to(@font) 
    else
      flash[:notice] = "Энэ глип ашиглагдаж байна"
      redirect_to [@font, @otf_glyph]
    end

  end
end

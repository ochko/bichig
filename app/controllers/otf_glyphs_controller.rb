class OtfGlyphsController < ApplicationController
  before_filter :require_editor, :except => [:index, :show]

  # GET /otf_glyphs
  # GET /otf_glyphs.xml
  def index
    @font = OpenTypeFont.find(params[:open_type_font_id])
    @otf_glyphs = @font.glyphs.order(:name)
    @otf_glyph = @font.glyphs.build
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
    respond_to do |format|
      format.html
      format.js  
    end
  end

  # POST /otf_glyphs
  # POST /otf_glyphs.xml
  def create
    @font = OpenTypeFont.find(params[:open_type_font_id])
    @otf_glyph = @font.glyphs.build(params[:otf_glyph])
    respond_to do |format|
      if @otf_glyph.save
        format.html { redirect_to(@font, :notice => 'Otf glyph was successfully created.') }
        format.js
      else
        format.html { render :action => "new" }
        format.js
      end
    end
  end

  # PUT /otf_glyphs/1
  # PUT /otf_glyphs/1.xml
  def update
    @font = OpenTypeFont.find(params[:open_type_font_id])
    @otf_glyph = OtfGlyph.find(params[:id])
    respond_to do |format|
      if @otf_glyph.update_attributes(params[:otf_glyph])
        format.html { redirect_to(@font, :notice => 'Otf glyph was successfully updated.') }
        format.js
      else
        format.html { render :action => "edit"  }
        format.js
      end
    end
  end

  # DELETE /otf_glyphs/1
  # DELETE /otf_glyphs/1.xml
  def destroy
    @font = OpenTypeFont.find(params[:open_type_font_id])
    @otf_glyph = OtfGlyph.find(params[:id])
    respond_to do |format|
      if @otf_glyph.orphan?
        @otf_glyph.destroy
        format.html { redirect_to(@font) }
        format.js 
      else
        format.html do
          flash[:notice] = "Энэ глип ашиглагдаж байна"
          redirect_to [@font, @otf_glyph]
        end
        format.js { render :text => "alert('Энэ глип ашиглагдаж байна')"}
      end
    end
  end
end

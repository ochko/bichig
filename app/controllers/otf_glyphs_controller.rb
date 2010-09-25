class OtfGlyphsController < ApplicationController
  # GET /otf_glyphs
  # GET /otf_glyphs.xml
  def index
    @otf_glyphs = OtfGlyph.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @otf_glyphs }
    end
  end

  # GET /otf_glyphs/1
  # GET /otf_glyphs/1.xml
  def show
    @otf_glyph = OtfGlyph.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @otf_glyph }
    end
  end

  # GET /otf_glyphs/new
  # GET /otf_glyphs/new.xml
  def new
    @otf_glyph = OtfGlyph.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @otf_glyph }
    end
  end

  # GET /otf_glyphs/1/edit
  def edit
    @otf_glyph = OtfGlyph.find(params[:id])
  end

  # POST /otf_glyphs
  # POST /otf_glyphs.xml
  def create
    @otf_glyph = OtfGlyph.new(params[:otf_glyph])

    respond_to do |format|
      if @otf_glyph.save
        format.html { redirect_to(@otf_glyph, :notice => 'Otf glyph was successfully created.') }
        format.xml  { render :xml => @otf_glyph, :status => :created, :location => @otf_glyph }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @otf_glyph.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /otf_glyphs/1
  # PUT /otf_glyphs/1.xml
  def update
    @otf_glyph = OtfGlyph.find(params[:id])

    respond_to do |format|
      if @otf_glyph.update_attributes(params[:otf_glyph])
        format.html { redirect_to(@otf_glyph, :notice => 'Otf glyph was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @otf_glyph.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /otf_glyphs/1
  # DELETE /otf_glyphs/1.xml
  def destroy
    @otf_glyph = OtfGlyph.find(params[:id])
    @otf_glyph.destroy

    respond_to do |format|
      format.html { redirect_to(otf_glyphs_url) }
      format.xml  { head :ok }
    end
  end
end

class OpenTypeFontsController < ApplicationController
  before_filter :require_editor, :except => [:index, :show]
  # GET /open_type_fonts
  # GET /open_type_fonts.xml
  def index
    @open_type_fonts = OpenTypeFont.all
    if @open_type_fonts.size == 1
      redirect_to @open_type_fonts.first
    end
  end

  # GET /open_type_fonts/1
  # GET /open_type_fonts/1.xml
  def show
    @open_type_font = OpenTypeFont.find(params[:id], :include => :features)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @open_type_font }
    end
  end

  # GET /open_type_fonts/new
  # GET /open_type_fonts/new.xml
  def new
    @open_type_font = OpenTypeFont.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @open_type_font }
    end
  end

  # GET /open_type_fonts/1/edit
  def edit
    @open_type_font = OpenTypeFont.find(params[:id])
  end

  # POST /open_type_fonts
  # POST /open_type_fonts.xml
  def create
    @open_type_font = OpenTypeFont.new(params[:open_type_font])

    respond_to do |format|
      if @open_type_font.save
        format.html { redirect_to(@open_type_font, :notice => 'Open type font was successfully created.') }
        format.xml  { render :xml => @open_type_font, :status => :created, :location => @open_type_font }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @open_type_font.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /open_type_fonts/1
  # PUT /open_type_fonts/1.xml
  def update
    @open_type_font = OpenTypeFont.find(params[:id])

    respond_to do |format|
      if @open_type_font.update_attributes(params[:open_type_font])
        format.html { redirect_to(@open_type_font, :notice => 'Open type font was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @open_type_font.errors, :status => :unprocessable_entity }
      end
    end
  end

  def compile
    @font = OpenTypeFont.find(params[:id])
    if @font.compiled?
      @file = @font.files.last
    else
      @file = @font.compile!
    end
    flash[:error] = "Error occured!" unless @file
    redirect_to @font
  end
end

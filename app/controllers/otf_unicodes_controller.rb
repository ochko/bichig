class OtfUnicodesController < ApplicationController
  # GET /otf_unicodes
  # GET /otf_unicodes.xml
  def index
    @otf_unicodes = OtfUnicode.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @otf_unicodes }
    end
  end

  # GET /otf_unicodes/1
  # GET /otf_unicodes/1.xml
  def show
    @otf_unicode = OtfUnicode.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @otf_unicode }
    end
  end

  # GET /otf_unicodes/new
  # GET /otf_unicodes/new.xml
  def new
    @otf_unicode = OtfUnicode.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @otf_unicode }
    end
  end

  # GET /otf_unicodes/1/edit
  def edit
    @otf_unicode = OtfUnicode.find(params[:id])
  end

  # POST /otf_unicodes
  # POST /otf_unicodes.xml
  def create
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
    @otf_unicode = OtfUnicode.find(params[:id])

    respond_to do |format|
      if @otf_unicode.update_attributes(params[:otf_unicode])
        format.html { redirect_to(@otf_unicode, :notice => 'Otf unicode was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @otf_unicode.errors, :status => :unprocessable_entity }
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

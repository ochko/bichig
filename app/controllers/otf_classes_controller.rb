class OtfClassesController < ApplicationController
  # GET /otf_classes
  # GET /otf_classes.xml
  def index
    @otf_classes = OtfClass.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @otf_classes }
    end
  end

  # GET /otf_classes/1
  # GET /otf_classes/1.xml
  def show
    @otf_class = OtfClass.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @otf_class }
    end
  end

  # GET /otf_classes/new
  # GET /otf_classes/new.xml
  def new
    @otf_class = OtfClass.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @otf_class }
    end
  end

  # GET /otf_classes/1/edit
  def edit
    @otf_class = OtfClass.find(params[:id])
  end

  # POST /otf_classes
  # POST /otf_classes.xml
  def create
    @otf_class = OtfClass.new(params[:otf_class])

    respond_to do |format|
      if @otf_class.save
        format.html { redirect_to(@otf_class, :notice => 'Otf class was successfully created.') }
        format.xml  { render :xml => @otf_class, :status => :created, :location => @otf_class }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @otf_class.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /otf_classes/1
  # PUT /otf_classes/1.xml
  def update
    @otf_class = OtfClass.find(params[:id])

    respond_to do |format|
      if @otf_class.update_attributes(params[:otf_class])
        format.html { redirect_to(@otf_class, :notice => 'Otf class was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @otf_class.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /otf_classes/1
  # DELETE /otf_classes/1.xml
  def destroy
    @otf_class = OtfClass.find(params[:id])
    @otf_class.destroy

    respond_to do |format|
      format.html { redirect_to(otf_classes_url) }
      format.xml  { head :ok }
    end
  end
end

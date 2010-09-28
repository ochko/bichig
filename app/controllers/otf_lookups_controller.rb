class OtfLookupsController < ApplicationController
  # GET /otf_lookups
  # GET /otf_lookups.xml
  def index
    @otf_lookups = OtfLookup.all(:include => :feature)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @otf_lookups }
    end
  end

  # GET /otf_lookups/1
  # GET /otf_lookups/1.xml
  def show
    @otf_lookup = OtfLookup.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @otf_lookup }
    end
  end

  # GET /otf_lookups/new
  # GET /otf_lookups/new.xml
  def new
    @otf_lookup = OtfLookup.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @otf_lookup }
    end
  end

  # GET /otf_lookups/1/edit
  def edit
    @otf_lookup = OtfLookup.find(params[:id])
  end

  # POST /otf_lookups
  # POST /otf_lookups.xml
  def create
    @otf_lookup = OtfLookup.new(params[:otf_lookup])

    respond_to do |format|
      if @otf_lookup.save
        expire_fragment("lookup-#{@otf_lookup.id}")
        format.html { redirect_to(@otf_lookup, :notice => 'Otf lookup was successfully created.') }
        format.xml  { render :xml => @otf_lookup, :status => :created, :location => @otf_lookup }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @otf_lookup.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /otf_lookups/1
  # PUT /otf_lookups/1.xml
  def update
    @otf_lookup = OtfLookup.find(params[:id])

    respond_to do |format|
      if @otf_lookup.update_attributes(params[:otf_lookup])
        expire_fragment("lookup-#{@otf_lookup.id}")
        format.html { redirect_to(@otf_lookup, :notice => 'Otf lookup was successfully updated.') }
        format.xml  { head :ok }        
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @otf_lookup.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /otf_lookups/1
  # DELETE /otf_lookups/1.xml
  def destroy
    @otf_lookup = OtfLookup.find(params[:id])
    @otf_lookup.destroy
    expire_fragment("lookup-#{@otf_lookup.id}")
    respond_to do |format|
      format.html { redirect_to(otf_lookups_url) }
      format.xml  { head :ok }
    end
  end
end

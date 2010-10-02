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
      format.js  { render :partial => 'show' }
    end
  end

  def new
    @otf_lookup = OtfLookup.new(:feature_id => params[:feature])
  end

  def edit
    @otf_lookup = OtfLookup.find(params[:id])    
  end

  def create
    @otf_lookup = OtfLookup.new(params[:otf_lookup])
    
    respond_to do |format|
      if @otf_lookup.save
        expire_fragment("lookup-#{@otf_lookup.id}")
        format.html { redirect_to(@otf_lookup.feature.open_type_font, :notice => 'Otf lookup was successfully created.') }
        format.js { @index = @otf_lookup.index + 1 }
      else
        render :action => "new"
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
        format.js
      else
        format.html { render :action => "edit" }
        format.js
      end
    end
  end

  # DELETE /otf_lookups/1
  # DELETE /otf_lookups/1.xml
  def destroy
    @otf_lookup = OtfLookup.find(params[:id])
    @index = @otf_lookup.index + 1
    @otf_lookup.destroy
    expire_fragment("lookup-#{@otf_lookup.id}")
    respond_to do |format|
      format.html { redirect_to(otf_lookups_url) }
      format.js
    end
  end
end

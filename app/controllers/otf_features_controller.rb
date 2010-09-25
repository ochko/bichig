class OtfFeaturesController < ApplicationController
  # GET /otf_features
  # GET /otf_features.xml
  def index
    @otf_features = OtfFeature.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @otf_features }
    end
  end

  # GET /otf_features/1
  # GET /otf_features/1.xml
  def show
    @otf_feature = OtfFeature.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @otf_feature }
    end
  end

  # GET /otf_features/new
  # GET /otf_features/new.xml
  def new
    @otf_feature = OtfFeature.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @otf_feature }
    end
  end

  # GET /otf_features/1/edit
  def edit
    @otf_feature = OtfFeature.find(params[:id])
  end

  # POST /otf_features
  # POST /otf_features.xml
  def create
    @otf_feature = OtfFeature.new(params[:otf_feature])

    respond_to do |format|
      if @otf_feature.save
        format.html { redirect_to(@otf_feature, :notice => 'Otf feature was successfully created.') }
        format.xml  { render :xml => @otf_feature, :status => :created, :location => @otf_feature }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @otf_feature.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /otf_features/1
  # PUT /otf_features/1.xml
  def update
    @otf_feature = OtfFeature.find(params[:id])

    respond_to do |format|
      if @otf_feature.update_attributes(params[:otf_feature])
        format.html { redirect_to(@otf_feature, :notice => 'Otf feature was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @otf_feature.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /otf_features/1
  # DELETE /otf_features/1.xml
  def destroy
    @otf_feature = OtfFeature.find(params[:id])
    @otf_feature.destroy

    respond_to do |format|
      format.html { redirect_to(otf_features_url) }
      format.xml  { head :ok }
    end
  end
end

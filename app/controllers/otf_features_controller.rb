class OtfFeaturesController < ApplicationController
  def index
    @font = OpenTypeFont.find(params[:open_type_font_id])
    @otf_features = @font.features

    render :layout => false
  end

  # GET /otf_features/1
  # GET /otf_features/1.xml
  def show
    @font = OpenTypeFont.find(params[:open_type_font_id])
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

  def edit
    @font = OpenTypeFont.find(params[:open_type_font_id])
    @otf_feature = OtfFeature.find(params[:id])
  end

  # POST /otf_features
  # POST /otf_features.xml
  def create
    @font = OpenTypeFont.find(params[:open_type_font_id])
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

  def update
    @font = OpenTypeFont.find(params[:open_type_font_id])
    @otf_feature = OtfFeature.find(params[:id])

    if @otf_feature.update_attributes(params[:otf_feature])
      redirect_to([@font, @otf_feature], :notice => 'Otf feature was successfully updated.') 
    else
      render :action => "edit" 
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

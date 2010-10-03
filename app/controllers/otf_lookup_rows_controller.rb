class OtfLookupRowsController < ApplicationController
  before_filter :require_editor, :except => [:index, :show]

  def new
    @otf_lookup = OtfLookup.find(params[:otf_lookup_id])
    @row = @otf_lookup.otf_lookup_rows.create(:user => current_user)
    redirect_to edit_otf_lookup_otf_lookup_row_path(@otf_lookup, @row)
    expire_fragment("lookup-#{@otf_lookup.id}")
  end

  def edit
    @otf_lookup = OtfLookup.find(params[:otf_lookup_id])
    @row = @otf_lookup.otf_lookup_rows.find(params[:id])
  end

  def show
    @otf_lookup = OtfLookup.find(params[:otf_lookup_id])
    @row = @otf_lookup.otf_lookup_rows.find(params[:id])
  end

  def destroy
    @otf_lookup = OtfLookup.find(params[:otf_lookup_id])
    @row = @otf_lookup.otf_lookup_rows.find(params[:id])
    @row.destroy
    @row.otf_classes.each { |klass| klass.delete unless klass.name}
    respond_to do |format|
      format.html { redirect_to @otf_lookup}
      format.js
    end
    expire_fragment("lookup-#{@otf_lookup.id}")
  end

end

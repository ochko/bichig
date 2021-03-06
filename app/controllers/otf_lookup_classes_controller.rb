class OtfLookupClassesController < ApplicationController
  before_filter :require_editor, :except => [:index, :show]

  def create
    @cell = OtfLookupClass.new(params[:otf_lookup_class])
    if params[:klass] =~ /^@/
      @klass = OtfClass.find_by_name(params[:klass])
    else
      glyphs = params[:klass].split.map { |name|
        @cell.otf_lookup.font.glyphs.find_by_name(name) }.compact
      unless glyphs.empty?
        @klass = @cell.otf_lookup.font.classes.create(:name => nil)
        @klass.otf_glyphs << glyphs
      end
    end
    @cell.otf_class = @klass
    @cell.save if @cell.otf_class
    expire_fragment("lookup-#{@cell.otf_lookup.id}")
    respond_to do |format|
      format.html {  redirect_to edit_otf_lookup_otf_lookup_row_path(@cell.otf_lookup, @cell.otf_lookup_row) }
      format.js
    end
  end

  def destroy
    @cell = OtfLookupClass.find(params[:id])
    @cell.destroy
    expire_fragment("lookup-#{@cell.otf_lookup.id}")
    respond_to do |format|
      format.html {  redirect_to edit_otf_lookup_otf_lookup_row_path(@cell.otf_lookup, @cell.otf_lookup_row) }
      format.js
    end
  end

  def update
  end

end

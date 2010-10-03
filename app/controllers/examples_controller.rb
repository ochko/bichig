class ExamplesController < ApplicationController
  before_filter :require_editor, :except => [:index, :show]
  def index
    @examples = Example.all
    @example = Example.new
    render :layout => false
  end

  # GET /examples/1
  # GET /examples/1.xml
  def show
    @example = Example.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @example }
    end
  end

  # GET /examples/new
  # GET /examples/new.xml
  def new
    @example = Example.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @example }
    end
  end

  # GET /examples/1/edit
  def edit
    @example = Example.find(params[:id])
    respond_to do |format|
      format.html
      format.js
    end
  end

  # POST /examples
  # POST /examples.xml
  def create
    @example = Example.new(params[:example])

    respond_to do |format|
      if @example.save
        format.html { redirect_to(@example, :notice => 'Example was successfully created.') }
        format.js
      else
        format.html { render :action => "new" }
        format.js { render :text => "alert('Sorry. Can not save!');" }
      end
    end
  end

  # PUT /examples/1
  # PUT /examples/1.xml
  def update
    @example = Example.find(params[:id])

    respond_to do |format|
      if @example.update_attributes(params[:example])
        format.html { redirect_to(@example, :notice => 'Example was successfully updated.') }
        format.js
      else
        format.html { render :action => "edit" }
        format.js
      end
    end
  end

  # DELETE /examples/1
  # DELETE /examples/1.xml
  def destroy
    @example = Example.find(params[:id])
    @example.destroy

    respond_to do |format|
      format.html { redirect_to(examples_url) }
      format.js
    end
  end
end

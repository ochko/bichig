class CategoriesController < ApplicationController
  def index
    render :json => Category.all.map{ |category| category.name }
  end

  def show
    @category = Category.find(params[:id])
    @file = OtfFile.find(params[:file])
    @rendered_examples = @file.rendered_examples.select { |re| re.example.category_id == @category.id}
  end
end

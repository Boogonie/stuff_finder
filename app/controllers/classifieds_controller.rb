class ClassifiedsController < ApplicationController

  def index
    @classifieds = Classified.all
    @categories = Category.all
  end

  def new
    @classified = Classified.new
    @classified.build_category
  end

  def create
    @classified = Classified.new(safe_classified_params)
    @classified.build_category(safe_category_params)

    if @classified.save
      redirect_to classified_path(@classified)
    else
      render 'new'
    end
  end

  def show
    @classified = Classified.find(params[:id])
  end

  private

  def safe_classified_params
    params.require(:classified).permit(:title, :price, :description)
  end

  def safe_category_params
    params.require(:category).permit(:name)
  end
end

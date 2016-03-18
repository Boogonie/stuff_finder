class ClassifiedsController < ApplicationController
  before_filter :authenticate_user!, only: [ :new, :create ]

  def index
    @classifieds = Classified.all
    @categories = Category.all
  end

  def new
    @classified = Classified.new
    @classified.build_category
  end

  def create
    @classified = current_user.classifieds.build(safe_classified_params)
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

  def my
    @classifieds = current_user.Classified

    render 'index'
  end

  private

  def safe_classified_params
    params.require(:classified).permit(:title, :price, :description, :image)
  end

  def safe_category_params
    params.require(:category).permit(:name)
  end
end

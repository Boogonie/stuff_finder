class ClassifiedsController < ApplicationController

  def index
    @classifieds = Classified.all
  end

  def new
    @classifieds = Classified.new
  end
end

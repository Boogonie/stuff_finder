class ClassifiedsController < ApplicationController

  def index
    @classifieds = Classifieds.new
  end

  def new

  end
end

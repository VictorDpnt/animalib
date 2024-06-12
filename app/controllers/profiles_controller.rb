class ProfilesController < ApplicationController
  def show
    @animal = Animal.new
    @review = Review.new
  end
end

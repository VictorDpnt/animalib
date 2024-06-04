class ProfilesController < ApplicationController
  def show
    @animal = Animal.new
  end
end

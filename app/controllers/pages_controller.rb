class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @profession = User.where.not(profession: nil)
    @animal = current_user.animals.first
  end
end

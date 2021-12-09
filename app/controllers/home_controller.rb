class HomeController < ApplicationController
  def index
    @response = AnilistApi.anime("Evangelion")
  end
end

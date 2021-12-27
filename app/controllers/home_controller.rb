class HomeController < ApplicationController
  def index
    @titles = Kaminari.paginate_array(AnilistApiService.most_popular).page(params[:page]).per(9)
  end
end

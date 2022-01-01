class HomeController < ApplicationController
  def index
    @titles = Kaminari.paginate_array(popular['media'], total_count: popular['pageInfo']['total'].to_i).page(params[:page]).per(10)
  end

  private

  def popular
    @page ||= AnilistApiService.most_popular(params.fetch(:page, 1).to_i)
  end
end

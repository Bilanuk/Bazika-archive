class SearchController < ApplicationController
    before_action :authenticate_user!

    def show
        @response = AnilistApiService.show(params[:id])['data']['Media']
    end

    def search
        return if params.dig(:search, :query).nil?

        query = params.dig(:search, :query)
        @response = Kaminari.paginate_array(AnilistApiService.anime(query)['data']['Page']['media']).page(params[:page]).per(10)
        # @response = AnilistApiService.anime(query)['data']['Page']['media']
    end
end

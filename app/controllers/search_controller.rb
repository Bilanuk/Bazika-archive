class SearchController < ApplicationController
    def show
        @is_favourite = is_favourite? if current_user
        @response = information
        @recommendations = Kaminari.paginate_array(information['recommendations']['edges']).page(params[:page]).per(5)
    end

    def search
        return if params.dig(:search, :query).nil?

        query = params.dig(:search, :query)
        @response = Kaminari.paginate_array(AnilistApiService.anime(query)).page(params[:page]).per(9)
    end

    private

    def information
        @response ||= AnilistApiService.show(params[:id])
    end

    def is_favourite?
        current_user.titles.exists?(api_id: params[:id])
    end
end

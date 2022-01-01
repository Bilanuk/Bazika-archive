class SearchController < ApplicationController
    def show
        @is_favourite = is_favourite? if current_user
        @response = information
        @recommendations = Kaminari.paginate_array(information['recommendations']['edges']).page(params[:page]).per(5)
        gon.is_favourite = is_favourite?
    end

    def search
        return if params.dig(:search, :query).nil?
        
        @response = Kaminari.paginate_array(search_results['media'], total_count: search_results['pageInfo']['total'].to_i).page(params[:page]).per(10)
    end

    private

    def information
        @response ||= AnilistApiService.show(params[:id])
    end

    def search_results
        query = params.dig(:search, :query)

        @results ||= AnilistApiService.anime(query, params.fetch(:page, 1).to_i).presence
    end

    def is_favourite?
        current_user.titles.exists?(api_id: params[:id]) if current_user
    end
end

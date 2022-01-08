class SearchController < ApplicationController
    def show
        @is_favourite = is_favourite? if current_user
        @status = get_status
        @response = information
        @recommendations = Kaminari.paginate_array(information['recommendations']['edges']).page(params[:page]).per(5)
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
        @results ||= AnilistApiService.anime(params.dig(:search, :query), params.fetch(:page, 1).to_i).presence
    end

    def is_favourite?
        current_user.titles.exists?(api_id: params[:id], favourite: true) if current_user
    end

    def get_status
        current_user.titles.where(api_id: params[:id]).where.not(status: nil)&.first&.status if current_user
    end
end

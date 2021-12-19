class SearchController < ApplicationController
    before_action :authenticate_user!

    def search
        return if params.dig(:search, :query).nil?

        query = params.dig(:search, :query)
        @response = AnilistApi.anime(query)['data']['Page']['media']
    end
end

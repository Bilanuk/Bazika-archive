class SearchController < ProfileController
    def show
        @response = AnilistApiService.show(params[:id])
    end

    def search
        return if params.dig(:search, :query).nil?

        query = params.dig(:search, :query)
        @response = Kaminari.paginate_array(AnilistApiService.anime(query)).page(params[:page]).per(9)
    end
end

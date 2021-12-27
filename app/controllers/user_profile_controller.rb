class UserProfileController < ProfileController
    before_action :authenticate_user!

    # def index
    #     @titles = []

    #     current_user.titles.each do |title|
    #         @titles.prepend(AnilistApiService.show(title.api_id))
    #     end

    #     @titles = Kaminari.paginate_array(@titles).page(params[:page]).per(9)
    # end

    def index
        @titles = current_user.titles.reverse_order.page(params[:page]).per(5)
    end

    def users
        @users = User.all
    end
end
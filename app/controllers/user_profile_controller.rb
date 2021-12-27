class UserProfileController < ProfileController
    before_action :authenticate_user!
    
    def index
        @titles = current_user.titles.reverse_order.page(params[:page]).per(5)
    end

    def users
        @users = User.all
    end
end
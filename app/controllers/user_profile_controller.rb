class UserProfileController < ProfileController
    before_action :authenticate_user!
    
    def index
        @titles = current_user.titles.where(favourite: true).reverse_order.page(params[:page]).per(5)
    end

    def users
        @users = User.where.not(id: current_user.id)
    end

    def user
        @titles = find_user.titles.reverse_order.page(params[:page]).per(5)
        find_user
    end

    private

    def find_user
        @user ||= User.find_by(id: params[:id])
    end
end
class UserProfileController < ProfileController    
    def users
        @users = User.all
    end

    def user
        get_user
        get_amount
    end

    private

    def get_user
        @user ||= User.find_by(id: params[:id])
    end

    def get_amount
        @arr = []
        Title.statuses.keys.each do |x|
            @arr.append(get_user.titles.where(status: x).size)
        end
        @arr.prepend(get_user.titles.where(favourite: true).size)
    end
end

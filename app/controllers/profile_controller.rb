class ProfileController < AccessController
    def favourites
        @titles = get_user.titles.where(favourite: true).order(updated_at: :desc).page(params[:page]).per(5)
    end

    def planning
        @titles = get_user.titles.where(status: 'planning').order(updated_at: :desc).page(params[:page]).per(5)
    end

    def watching
        @titles = get_user.titles.where(status: 'watching').order(updated_at: :desc).page(params[:page]).per(5)
    end
    
    def watched
        @titles = get_user.titles.where(status: 'watched').order(updated_at: :desc).page(params[:page]).per(5)
    end

    protected

    def get_user
        current_user
    end
end

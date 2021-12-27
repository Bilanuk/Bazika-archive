class TitlesController < ProfileController
    def create
        title = current_user.titles.build(title_params)
        @is_favourite = false
        
        if title.save
            flash.now[:notice] = 'Title saved to your favourites'
            @is_favourite = true
        elsif find_title.present?
            find_title.destroy
            flash.now[:warning] = 'You removed this from favourites'
            @is_favourite = false
        else
            flash.now[:alert] = 'Something went wrong'
        end

    end

    private

    def is_favourite?
        current_user.titles.exists?(api_id: title_params[:api_id])
    end

    def find_title
        title ||= current_user.titles.find_by(api_id: title_params[:api_id])
    end

    def title_params
        params.require(:title).permit(:api_id, :name, :description, :coverImage, :title_type, :genres => [])
    end
end

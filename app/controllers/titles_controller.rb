class TitlesController < ProfileController
    def create
        title = current_user.titles.build(title_params)
        
        if title.save
            flash.now[:notice] = 'Title saved to your favourites'
        elsif find_title.present?
            find_title.destroy
            flash.now[:warning] = 'You removed this from favourites'
        else
            flash.now[:alert] = 'Something went wrong'
        end
        
        @is_favourite = is_favourite?
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

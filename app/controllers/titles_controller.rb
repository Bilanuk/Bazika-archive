class TitlesController < ApplicationController
    def create
        title = current_user.titles.build(title_params)
        
        if title.save
            flash[:notice] = 'Title saved to your favourites'
        elsif find_title.present?
            find_title.destroy
            flash[:alert] = 'You removed this from favourites'
        else
            flash[:alert] = 'Something went wrong'
        end

        redirect_to request.referrer
    end

    private

    def find_title
        title ||= current_user.titles.find_by(api_id: title_params[:api_id])
    end

    def title_params
        params.require(:title).permit(:api_id, :name, :description, :coverImage, :title_type, :genres => [])
    end
end

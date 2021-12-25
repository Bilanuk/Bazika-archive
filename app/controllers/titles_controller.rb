class TitlesController < ApplicationController
    def index
        @titles = current_user.titles.where(api_id: params[:api_id])
    end

    def create
        title = current_user.titles.build(title_params)
        
        if title.save
            flash[:notice] = 'Title saved to your favourites'
        elsif current_user.titles.find_by(api_id: title_params[:api_id]).present?
            flash[:alert] = 'You already added to your favourites'
        else
            flash[:alert] = 'Something went wrong'
        end

        redirect_to request.referrer
    end

    private

    def title_params
        params.require(:title).permit(:api_id, :name)
    end
end

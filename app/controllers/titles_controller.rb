class TitlesController < ProfileController
    def create_favourite
        title = find_title.presence
        is_favourite = is_favourite?

        if title.present? && is_favourite == false
            flash.now[:notice] = 'Title saved to your favourites' if title.update(favourite: true)
        elsif title.present? && is_favourite == true
            flash.now[:warning] = 'You removed this from favourites' if title.update(favourite: false)
        elsif title.nil?
            title = current_user.titles.build(get_info)
            flash.now[:notice] = 'Title saved to your favourites' if title.save
        end

        @is_favourite = title.favourite
    end

    def set_status
        title = find_title.presence

        if title.present?
            if title.status != title_params[:status]
                flash.now[:success] = "Title saved to your #{title_params[:status]}" 
                # title.update_columns(status: title_params[:status]) 
                title.update(status: title_params[:status])
            else
                flash.now[:warning] = "Title removed from #{title_params[:status]}"
                title.update(status: nil)
            end
        else 
            title = current_user.titles.build(get_info)
            if title.save!
                flash.now[:notice] = "Title saved to your #{title.status}" if title.save
            else
                flash.now[:warning] = 'Error'
            end
        end

        @status = title.status
    end


    private

    def is_favourite?
        current_user.titles.where(api_id: title_params[:api_id], favourite: true).exists?
    end

    def find_title
        title ||= current_user.titles.find_by(api_id: title_params[:api_id])
    end

    def get_info
        @info ||= AnilistApiService.save(title_params[:api_id], title_params)
    end

    def title_params
        params.require(:title).permit(:api_id, :favourite, :status)
    end
end

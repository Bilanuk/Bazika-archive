class ProfileController < ApplicationController
    def index
        @titles = current_user.titles
    end
end

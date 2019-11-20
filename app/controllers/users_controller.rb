class UsersController < ApplicationController

    def my_portfolio
        @user = current_user
        @user_stocks = current_user.stocks
    end

    def my_friends
        @friendships = current_user.friends
    end

    def search
        if params[:search_param].blank?
            flash.now[:danger] = "You have not entered a search value"
        else
            @users = User.search(params[:search_param])
            errorSearch = params[:search_param]
            flash.now[:danger] = "No matches for #{ errorSearch }" unless @users.blank?
        end
        respond_to do |format|
            format.js { render partial: 'friends/result' }
        end
    end
    
end
class StocksController < ApplicationController
    def search
        if params[:stock].blank?
            flash.now[:danger] = "You have not entered a search value"
        else
            @stock = Stock.new_from_lookup(params[:stock])
            errorStock = params[:stock]
            flash.now[:danger] = "No matches for #{ errorStock }" unless @stock
        end
        respond_to do |format|
            format.js { render partial: 'users/result' }
        end
    end
end
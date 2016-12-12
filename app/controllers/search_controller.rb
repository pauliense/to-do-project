class SearchController < ApplicationController

  def index

    @search_term = params[:query]

    if params[:query].present?
     @tasks = Task.own_task(current_user).search_for(@search_term)
    # else
      # @tasks = ["text"]
    end
  end
end

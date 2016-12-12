class SearchController < ApplicationController

  def index


    if params[:query].present?
     @tasks = Task.own_task(current_user).search_for(params[:query])
    # else
      # @tasks = ["text"]
    end
  end
end

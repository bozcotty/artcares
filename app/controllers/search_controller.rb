class SearchController < ApplicationController
  def index
    # include PgSearch
    @search = PgSearch.multisearch(params[:search])
    @results = @search.map(&:searchable).paginate(page: params[:page], per_page: 5)
  end
end

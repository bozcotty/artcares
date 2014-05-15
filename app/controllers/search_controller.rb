class SearchController < ApplicationController
  def index
    # include PgSearch
    @search = PgSearch.multisearch(params[:search])
    @results = @search.map do |result|
      result.searchable
    end.paginate(page: params[:page], per_page: params[:per_page] || 10)
  end
end

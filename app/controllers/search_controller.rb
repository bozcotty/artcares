class SearchController < ApplicationController
  def index
    include PgSearch
    @search = PgSearch.multisearch(PatientCampaign, Artwork, User) do
      fulltext params[:search]
      paginate(page: params[:page], per_page: 5)
    end
    @results = @search.results
  end
end


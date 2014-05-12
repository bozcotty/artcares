class SearchController < ApplicationController
  def index
    @search = Sunspot.search(PatientCampaign, Artwork, User) do
      fulltext params[:search]
      paginate(page: params[:page], per_page: 5)
    end
    @results = @search.results
  end
end
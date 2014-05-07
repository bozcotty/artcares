class SearchController < ApplicationController
  def index
    @search = Sunspot.search(PatientCampaign, Artwork, User) do
      fulltext params[:search]
    end
    @results = @search.results
  end
end

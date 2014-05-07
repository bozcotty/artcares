class SearchController < ApplicationController
  def index
    @search = Sunspot.search(PatientCampaign, Artwork) do
      fulltext params[:search]
    end
    @results = @search.results
  end
end

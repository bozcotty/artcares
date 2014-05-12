class SearchController < ApplicationController
  def index
    @search = Sunspot.search(PatientCampaign, Artwork, User) do
      fulltext params[:search]
    end
    @results = @search.results{paginate(page: params[:page], per_page:3)}
  end
end

module ArtworksHelper
  def artworks_index_heading
    case
    when params[:category]
      params[:category].capitalize
    when params[:min_price]
      "$#{params[:min_price]} - $#{params[:max_price]}"
    else
      'All Art'
    end
  end
end

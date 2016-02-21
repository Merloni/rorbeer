class BeermappingApi
  def self.places_in(city)
    url = 'http://stark-oasis-9187.herokuapp.com/api/'
    response = HTTParty.get "#{url}#{ERB::Util.url_encode(city)}"


    places = response.parsed_response["bmp_locations"]["location"]

    if places.is_a?(Hash) and places['id'].nil?
      redirect_to places_path, :notice => "No places in #{city]}"
    else
      places = [places] if places.is_a?(Hash)
      @places = places.map do | location |
        Place.new(location)
      end
      render :index
    end
  end
end
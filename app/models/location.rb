class Location
  
  def self.find(query)
    Location.new(query)
  end

  def initialize(query)
    @search = Geocoder.search(query)[0]
  end 

  def to_json
    {
      city: city,
      neighborhood: neighborhood,
      address: address,
      zipcode: zipcode
    }.to_json
  end 

  def city
    @search.data["address_components"].select {|component|
      component["types"] && component["types"][0] == "locality"
    }[0]["short_name"]
  end 

  def neighborhood
    @search.data["address_components"].select {|component|
      component["types"] && component["types"][0] == "neighborhood"
    }[0]["short_name"]
  end 

  def address
    "#{street_number} #{route}"
  end   

  def zipcode
    @search.data["address_components"].select {|component|
      component["types"] && component["types"][0] == "postal_code"
    }[0]["short_name"]
  end 

private 

  def street_number
    @search.data["address_components"].select {|component|
      component["types"] && component["types"][0] == "street_number"
    }[0]["short_name"]
  end

  def route
    @search.data["address_components"].select {|component|
      component["types"] && component["types"][0] == "route"
    }[0]["long_name"]
  end
end
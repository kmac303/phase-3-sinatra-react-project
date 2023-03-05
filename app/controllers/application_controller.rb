class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  get "/" do
    { 
      locations: Location.all, 
      venues: Venue.all
    }.to_json
  end

  get "/venues" do
    { 
      venues: Venue.all
    }.to_json
  end

  post '/venues' do
    new_venue = Venue.new(params[:venue])
    if new_venue.save
      {
        venue: new_venue
      }.to_json
    else
      {
        message: "Oops something went wrong"
      }.to_json
    end
  end

  get '/venues/:id' do
    venue = Venue.find(params[:id])
    venue.to_json
  end

  patch '/venues/:id' do
    venue = Venue.find(params[:name])
    venue.update(
      id: params[:id]
    )
    venue.to_json
  end

  delete '/venues/:id' do
    venue = Venue.find(params[:id])
    venue.destroy
  end

  get "/locations" do
    Location.all.to_json(include: :venues)
  end

  post '/locations' do
    new_location = Location.new(params[:location])
    if new_location.save
      {
        location: new_location
      }.to_json
    else
      {
        message: "Oops something went wrong"
      }.to_json
    end
  end

  patch '/location/:id' do
    location = Location.find(params[:id])
    # binding.pry
    location.update(
      city: params[:city],
      state: params[:state],
      image_url: params[:image_url]
    )
    location.to_json
  end

  get '/locations/:id' do
    location = Location.find(params[:id])
    location.to_json
  end

  get '/locations/:id/venues' do
    content_type :json
    location = Location.find(params[:id])
    venue = location.venues.new(params)
    { venue: venue }.to_json
  end

  

end

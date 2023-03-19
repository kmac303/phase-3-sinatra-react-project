class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  get "/" do
    { 
      locations: Location.all, 
    }.to_json
  end 

  get "/venues" do
    { 
      venues: Venue.all
    }.to_json
  end

  get '/venues/new' do
    venue = Venue.all
    venue.to_json(include: :city)
  end

  post '/venues' do
    new_venue = Venue.create(
      name: params[:name],
      description: params[:description],
      image_url: params[:image_url],
      capacity: params[:capacity],
      location_id: params[:location_id]
    )
    new_venue.to_json
  end

  #   post '/venues' do
  #   new_venue = Venue.new(params[:venue])
  #     {
  #       venue: new_venue
  #     }.to_json
  # end

  delete '/venues/:id' do
    venue = Venue.find(params[:id])
    venue.destroy
    venue.to_json
  end



  get '/venues/:id' do
    venue = Venue.find(params[:id])
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
    new_location = Location.create(
      city: params[:city],
      state: params[:state],
      image_url: params[:image_url]
    )
    new_location.to_json
  end

  patch '/venues/:id' do
    venue = Venue.find(params[:id])
    venue.update(
      name: params[:name],
      description: params[:description],
      capacity: params[:capacity]
    )
    venue.to_json
  end

  get '/locations/:id' do
    location = Location.find(params[:id])
    location.to_json(include: :venues)
  end

  get '/locations/:id/venues' do
    content_type :json
    location = Location.find(params[:id])
    venue = location.venues
    { venue: venue }.to_json
  end

end

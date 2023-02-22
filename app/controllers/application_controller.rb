class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  get "/" do
    { 
      locations: Location.all, 
      venues: Venue.all
    }.to_json
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

  get '/locations/:id' do
    location = Location.find(params[:id])
    location.to_json
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
    # binding.pry
    venue.update(
      id: params[:id]
    )
    venue.to_json
  end

  delete '/venues/:id' do
    venue = Venue.find(params[:id])
    venue.destroy
  end

  

end

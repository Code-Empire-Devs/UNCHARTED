require 'rails_helper'

RSpec.describe "Trips", type: :request do

  describe "GET /index" do
    it "gets a list of trips" do
      
      user = User.where(email: 'test@test.test').first_or_create(password: '12345678', password_confirmation: '12345678')
      
      user.trips.create(
        name: 'Wyatt John',
        location: 'Paris, France',
        from: 20220911,
        to: 20220915,
        travel_buddies: 'Josh, Apple, and Peach',
        comments: 'Loved the Effiel Tower',
        image: 'https://photos.zillowstatic.com/fp/7f7209dfbb519e5aa13446bbbd60c43d-cc_ft_576.webp'
        
      )

      get '/trips'

      trip = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(trip.length).to eq 1
    end
  end

  describe "POST /create" do
    
    it "creates a new trip " do
      
      user1 = User.where(email: 'test@test.com').first_or_create(password: '12345678', password_confirmation: '12345678')
      
      trip_params = {
        trip: {
          name: 'Grand Canyon',
          location: 'Arizona',
          from: 20220504,
          to: 20220510,
          travel_buddies: 'Family',
          comments: 'Birthday getaway for Mom',
          image: 'https://upload.wikimedia.org/wikipedia/commons/a/aa/Dawn_on_the_S_rim_of_the_Grand_Canyon_%288645178272%29.jpg',
          user_id: user1.id
      }
    }
      post '/trips', params: trip_params

      trip = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(trip['name']).to eq 'Grand Canyon'

    end
  end
  
  describe "DELETE /destroy" do
    it "deletes a trip entry" do
      trip_params = {
        trip: {
          name: 'Grand Canyon',
          location: 'Arizona',
          from: 20220504,
          to: 20220510,
          travel_buddies: 'Family',
          comments: 'Birthday getaway for Mom',
          image: 'https://upload.wikimedia.org/wikipedia/commons/a/aa/Dawn_on_the_S_rim_of_the_Grand_Canyon_%288645178272%29.jpg',
          
        }
      }
    post "/trips", params: trip_params
    trip = Trip.first
    delete "/trips/#{trip.id}"
    expect(response).to have_http_status(200)
    trips = Trip.all
    expect(trips).to be_empty 
    end
  end
end
require 'rails_helper'

RSpec.describe "Trips", type: :request do
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
end
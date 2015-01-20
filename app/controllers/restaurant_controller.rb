class RestaurantController < ApplicationController
  def map
  end

  def list
    json = File.read(Rails.root + 'app/assets/restaurants.json')

    respond_to do |format|
      format.html {
        @restaurants =  JSON.parse(json)
        render
      }
      format.json { render :json => json }
    end
  end

  def add_rating
  end
end

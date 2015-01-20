class RestaurantController < ApplicationController
  def map
  end

  def list
    respond_to do |format|
      format.html { render }
      format.json { render :json => File.read(Rails.root + 'app/assets/restaurants.json') }
    end
  end

  def add_rating
  end
end

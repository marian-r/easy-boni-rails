class RestaurantController < ApplicationController
  include RestaurantHelper

  def map
  end

  def list
    json = File.read(Rails.root + 'app/assets/restaurants.json')

    respond_to do |format|
      format.html {
        @restaurants = add_rating_to_restaurants(JSON.parse(json))
        render
      }
      format.json { render :json => json }
    end
  end

  def add_rating
    rating = Rating.new(restaurant_id: params[:id], user: current_user, value: params[:value])
    rating.save

    ratingVal = Rating.where(restaurant_id: params[:id]).average('value')

    render :partial => 'rating', :locals => { :restaurant_id => params[:id], :rating => ratingVal }
  end
end

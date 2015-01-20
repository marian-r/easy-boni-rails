module RestaurantHelper
  def add_rating_to_restaurants(list)

    ratings = Rating.all

    list.each do |restaurant|
      avg = ratings.where(restaurant_id: restaurant['id']).average('value')

      restaurant['rating'] = avg
    end
  end
end

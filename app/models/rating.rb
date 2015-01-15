class Rating < ActiveRecord::Base
  self.primary_keys = :restaurant_id, :user_id
  belongs_to :user
end

class User < ActiveRecord::Base
  has_many :ratings
  has_secure_password
end

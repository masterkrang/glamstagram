class Photo < ActiveRecord::Base
  attr_accessible :source, :url, :user_id
end

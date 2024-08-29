class Follow < ApplicationRecord
  belongs_to :fan, class_name: 'User', foreign_key: 'follower_id'
  belongs_to :idol, class_name: 'User', foreign_key: 'followee_id'
end

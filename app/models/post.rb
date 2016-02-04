class Post < ActiveRecord::Base
  belongs_to :ritual
  belongs_to :whiskey
  belongs_to :user
end

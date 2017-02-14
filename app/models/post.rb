class Post < ApplicationRecord
  acts_as_taggable
  has_many :comments
end

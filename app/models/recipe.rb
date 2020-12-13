class Recipe < ApplicationRecord
  has_many :comments
  has_many :ingrs
  belongs_to :user

end

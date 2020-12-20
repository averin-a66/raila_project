class Recipe < ApplicationRecord
  validates :name, presence: true
  validates :body, presence: true
  has_many :comments
  has_many :ingrs
  belongs_to :user
  accepts_nested_attributes_for :ingrs, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :comments, :reject_if => :all_blank, :allow_destroy => true
end

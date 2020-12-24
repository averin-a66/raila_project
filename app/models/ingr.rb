class Ingr < ApplicationRecord
  validates :name_in, presence: true
  validates :amount_in, presence: true
  validates :enum_id, presence:true
  belongs_to :recipe
  belongs_to :enum
end

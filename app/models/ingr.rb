class Ingr < ApplicationRecord
  belongs_to :recipe
  belongs_to :enum
end

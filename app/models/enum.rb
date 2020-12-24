class Enum < ApplicationRecord
  validates :name, presence: true
  validates :short, presence: true
  validates :system_id, presence:true
  belongs_to :system
end

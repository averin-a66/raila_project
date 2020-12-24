class Country < ApplicationRecord
  validates :state, presence: true
  validates :system_id, presence: true
  belongs_to :system
end

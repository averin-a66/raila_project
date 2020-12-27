class Enum < ApplicationRecord
  validates :name, presence: true
  validates :short, presence: true
  validates :system_id, presence:true
  belongs_to :system
  def translated_name
    "#{YTrans::translate_text(name, 'ru', 'en')}"
  end
end

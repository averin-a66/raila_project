class EnumConvert < ApplicationRecord
  belongs_to :enum_from, class_name: "Enum"
  belongs_to :enum_to, class_name: "Enum"
end

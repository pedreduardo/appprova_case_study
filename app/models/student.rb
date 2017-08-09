class Student < ApplicationRecord
  belongs_to :member
  scope :filter, ->(arg){ where("name LIKE ? OR enem_number LIKE ?", "%#{arg}%", "%#{arg}%").order(name: :desc) }
end

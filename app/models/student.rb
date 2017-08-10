class Student < ApplicationRecord
  belongs_to :member
  scope :filter, ->(arg){ where("name LIKE ? OR enem_number LIKE ?", "%#{arg}%", "%#{arg}%").order('name') }
  scope :my_alumni, ->(arg){ where("member_id = ?", "#{arg}").order('name') }
end

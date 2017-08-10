class Student < ApplicationRecord
  belongs_to :member
  scope :filter, ->(search){ where("name LIKE ? OR enem_number LIKE ?", "%#{search}%", "%#{search}%").order('name') }
  scope :mine, ->(member_id){ where(member_id: member_id.id).order('name') }
  scope :not_mine, ->(member_id){ where.not(member_id: member_id.id).order('name') }
end

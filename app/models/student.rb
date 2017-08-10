class Student < ApplicationRecord
  belongs_to :member
  before_create :upcase_fields
  scope :filter, ->(search){ where("name LIKE ? OR enem_number LIKE ?", "%#{search}%", "%#{search}%").order('name') }
  scope :mine, ->(member_id){ where(member_id: member_id.id).order('name') }
  scope :not_mine, ->(member_id){ where.not(member_id: member_id.id).order('name') }

  def upcase_fields
    self.name.upcase!
    self.university.upcase!
    self.course.upcase!
    self.campus.upcase! if self.campus.present?
    self.obs.upcase! if self.obs.present?
  end
end
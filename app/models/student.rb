class Student < ApplicationRecord
  belongs_to :member
  before_create :upcase_fields
  scope :filter, ->(search) { where('name LIKE ? OR enem_number LIKE ?', "%#{search}%", "%#{search}%").order('name') }
  scope :mine, ->(member_id) { where(member_id: member_id.id).order('name') }
  scope :not_mine, -> { where(member_id: 1).order('name') }

  def upcase_fields
    name.upcase!
    university.upcase!
    course.upcase!
    campus.upcase! if campus.present?
    obs.upcase! if obs.present?
  end
end

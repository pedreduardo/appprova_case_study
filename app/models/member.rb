class Member < ApplicationRecord
  validates_presence_of :first_name, :last_name, :name_school, :cnpj_school, :cell_phone
  has_many :students

  scope :average_students, -> {
    where.not(id: 1)
         .joins(:students)
         .select('members.id ,members.name_school, count(students.id) as student_count')
         .group('members.id')
  }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def name
    "#{first_name} #{last_name}"
  end
end

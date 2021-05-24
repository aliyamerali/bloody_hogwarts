class Course < ApplicationRecord
  validates :name, presence: true

  has_many :student_courses, dependent: :destroy
  has_many :students, through: :student_courses, dependent: :destroy
end

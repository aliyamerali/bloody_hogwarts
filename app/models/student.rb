class Student < ApplicationRecord
  validates :name, presence: true
  validates :age, presence: true
  validates :house, presence: true

  has_many :student_courses, dependent: :destroy
  has_many :courses, through: :student_courses, dependent: :destroy

  def self.avg_age
    average(:age)
  end

  def self.alphabetically
    order(name: :asc)
  end
end

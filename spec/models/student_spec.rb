require 'rails_helper'

RSpec.describe Student, type: :model do

  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
    it {should validate_presence_of :house}
  end

  describe 'relationships' do
    it {should have_many :student_courses}
    it {should have_many(:courses).through(:student_courses)}
  end

  describe 'class methods' do
    it '#avg_age returns average age of all students' do
      @harry = Student.create!(name: "Harry Potter", age: "13", house: "Gryffendor")
      @malfoy = Student.create!(name: "Draco Malfoy", age: "15", house: "Slytherine")

      expect(Student.avg_age).to eq(14)
    end
  end

end

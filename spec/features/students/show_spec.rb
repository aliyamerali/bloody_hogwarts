require 'rails_helper'

RSpec.describe 'students show page', type: :feature do
  before :each do
    @harry = Student.create!(name: "Harry Potter", age: "13", house: "Gryffendor")
    @malfoy = Student.create!(name: "Draco Malfoy", age: "13", house: "Slytherine")

    @potions = @harry.courses.create!(name: "Potions")
    @herbology =  @harry.courses.create!(name: "Herbology")

    @malfoy.courses << @potions
  end

  it 'shows a list of the student\'s courses' do
    visit "/students/#{@harry.id}"

    expect(page).to have_content(@potions.name)
    expect(page).to have_content(@herbology.name)


      visit "/students/#{@malfoy.id}"

      expect(page).to have_content(@potions.name)
  end
end

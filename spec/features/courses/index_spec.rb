require 'rails_helper'

RSpec.describe 'courses index page', type: :feature do
  before :each do
    @harry = Student.create!(name: "Harry Potter", age: "13", house: "Gryffendor")
    @malfoy = Student.create!(name: "Draco Malfoy", age: "13", house: "Slytherine")

    @potions = @harry.courses.create!(name: "Potions")
    @herbology =  @harry.courses.create!(name: "Herbology")

    @malfoy.courses << @potions

    visit '/courses'
  end

  it 'shows the list of all courses with the count of students enrolled' do
    expect(page).to have_content("Potions: 2")
    expect(page).to have_content("Herbology: 1")
  end
end

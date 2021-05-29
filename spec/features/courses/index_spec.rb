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

  it 'shows the list of all courses sorted alphabetically with the count of students enrolled' do
    expect(page).to have_content("Potions: 2")
    expect(page).to have_content("Herbology: 1")
    expect("Herbology").to appear_before("Potions")
  end

  it 'shows the list of students per course sorted alphabetically' do
    within('.Potions') do
      expect(page).to have_content(@harry.name)
      expect(page).to have_content(@malfoy.name)
      expect(@malfoy.name).to appear_before(@harry.name)
    end
    within('.Herbology') do
      expect(page).to have_content(@harry.name)
    end
  end
end

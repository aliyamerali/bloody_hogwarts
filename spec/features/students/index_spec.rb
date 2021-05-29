require 'rails_helper'

RSpec.describe 'Students index page', type: :feature do
  before :each do
    @harry = Student.create!(name: "Harry Potter", age: "13", house: "Gryffendor")
    @malfoy = Student.create!(name: "Draco Malfoy", age: "15", house: "Slytherine")

    visit '/students'
  end

  it 'shows a list of students with their name, age, house in alphabetical order' do
    expect(page).to have_content(@harry.name)
    expect(page).to have_content(@harry.age)
    expect(page).to have_content(@harry.house)
    expect(page).to have_content(@malfoy.name)
    expect(page).to have_content(@malfoy.age)
    expect(page).to have_content(@malfoy.house)
    expect(@malfoy.name).to appear_before(@harry.name)
  end

  it 'shows average age of all students' do
    expect(page).to have_content("Average Age: 14")
  end
end

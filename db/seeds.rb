# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Student.destroy_all
Course.destroy_all

@harry = Student.create!(name: "Harry Potter", age: "13", house: "Gryffendor")
@malfoy = Student.create!(name: "Draco Malfoy", age: "13", house: "Slytherine")

@potions = @harry.courses.create!(name: "Potions")
@herbology =  @harry.courses.create!(name: "Herbology")

@malfoy.courses << @potions

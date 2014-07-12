# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.create(:title => "Abstract", :category_id => "1")
Category.create(:title => "Photography", :category_id => "2")
Category.create(:title => "Decorative Art", :category_id => "3")
Category.create(:title => "Landscape", :category_id => "4")
Category.create(:title => "Fine Art", :category_id => "5")
Category.create(:title => "Vintage", :category_id => "6")
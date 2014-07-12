# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Category.create(:title => "Abstract")
Category.create(:title => "Photography")
Category.create(:title => "Decorative Art")
Category.create(:title => "Landscape")
Category.create(:title => "Fine Art")
Category.create(:title => "Vintage")
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(:name => "admin", :password => "pass")
User.create(:name => "adnane", :password => "pass")
User.create(:name => "ali", :password => "pass")


Category.create(:title => "Abstract")
Category.create(:title => "Photography")
Category.create(:title => "Decorative Art")
Category.create(:title => "Landscape")
Category.create(:title => "Fine Art")
Category.create(:title => "Vintage")

Product.create (:title => "Picasso", 
	:description=>"This is what's called abstract art It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using", 
	:image_url=>"abstract2.jpg",
	:price=>"50000.25",
	:category_id=>"Abstract")


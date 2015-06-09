# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
json = ActiveSupport::JSON.decode(File.read('db/Listing.json'))
json = json['results']
json.each do |a|
  Listing.create!(name: a['name'], branch: a['branch'], address: a['address_1'], postal_code: a['postal_code'], city: a['city'], state: a['state'], country: a['country'], 
  	phone: a['phone'], email: a['email'], website: a['website'], facebook: a['facebook'], twitter: a['twitter'], instagram: a['instagram'], yelp: a['yelp'], logo_url: a['logo_url'], 
  	latitude: a['location']['latitude'], longitude: a['location']['longitude'], description: a['description'])
end


  json = ActiveSupport::JSON.decode(File.read('db/Tag.json'))['results']
  json.each do |a|
  	Tag.create!(name: a['name'])

	end
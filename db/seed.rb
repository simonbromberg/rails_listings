json = ActiveSupport::JSON.decode(File.read('db/Listing.json'))
 
 i = 0
json.each do |a|
	if i > 10
		break
	end
	i = i + 1
  Listing.create(name: a['name'], address: a['address_1'], postal_code: a['postal_code'], city: a['city'], country: a['country'], latitude: a['location']['latitude'], latitude: a['location']['longitude'])
end
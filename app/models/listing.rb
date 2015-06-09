class Listing < ActiveRecord::Base
	has_many :taggings
	has_many :tags, through: :taggings
	validates :name, presence: true
	validates :address, presence: true
	validates :city, presence: true
	validates :country, presence: true
	validates :postal_code, presence: true
	acts_as_mappable :lat_column_name => :latitude,
					 :lng_column_name => :longitude

	def fullname
		return self.name + " - " + self.branch if !self.branch.nil?
		return self.name
	end

	def full_address
		return (self.address.to_s + " " + self.postal_code.to_s + "<br>" + self.city.to_s + " " + self.state.to_s + " " + self.country.to_s).html_safe
	end

	def self.search(search,lat,lng)
		if lat && lng
			Listing.within(50, :origin => [lat,lng]).all
		elsif search
			where('name LIKE ?', "%#{search}%" )
		else 
			all
		end
	end
end

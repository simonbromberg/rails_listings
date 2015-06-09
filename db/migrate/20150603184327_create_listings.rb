class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
    t.string :name
    t.string :branch
    t.string :address
    t.string :postal_code
    t.string :city
    t.string :country
    t.float :latitude
    t.float :longitude
    t.string :phone
    t.string :email
    t.string :website
    t.string :facebook
   	t.string :twitter
   	t.string :yelp
   	t.string :instagram
   	t.string :description
   	t.string :state
   	t.string :logo_url

    t.timestamps null: false
    end
  end
end

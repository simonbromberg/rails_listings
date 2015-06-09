class CreateTaggings < ActiveRecord::Migration
  def change
    create_table :taggings do |t|
    	t.belongs_to :tag, index: true
    	t.belongs_to :listing, index: true
      t.timestamps null: false
    end
  end
end

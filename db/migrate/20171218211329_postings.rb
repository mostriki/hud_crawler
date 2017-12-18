class Postings < ActiveRecord::Migration[5.1]
  def change
    create_table :postings do |t|
      t.string :posting_link
      t.string :posting_title
      t.text :posting_body
      t.decimal :posting_price
      t.integer :posting_bedroom
      t.integer :posting_square_feet
      t.string :posting_specific_location
      t.string :posting_address
      t.string :posting_email
      t.string :posting_phone
      t.string :posting_housing_type
      t.string :posting_date_posted
      t.integer :posting_post_id
      t.string :posting_parking
      t.boolean :posting_furnished
      t.boolean :posting_wheelchair
      t.boolean :complete
      t.boolean :discrimination

      t.timestamps
    end
  end
end

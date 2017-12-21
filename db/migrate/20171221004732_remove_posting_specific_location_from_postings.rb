class RemovePostingSpecificLocationFromPostings < ActiveRecord::Migration[5.1]
  def change
    remove_column :postings, :posting_specific_location, :string
    add_column :postings, :posting_location, :string
  end
end

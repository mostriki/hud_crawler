class RemoveCompleteFromPostings < ActiveRecord::Migration[5.1]
  def change
    remove_column :postings, :complete, :boolean
    add_column :postings, :contacted, :boolean
  end
end

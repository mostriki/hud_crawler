class RemoveDiscriminationFromPostings < ActiveRecord::Migration[5.1]
  def change
    remove_column :postings, :discrimination, :boolean
  end
end

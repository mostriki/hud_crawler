class RemovePostingPriceFromPostings < ActiveRecord::Migration[5.1]
  def change
    remove_column :postings, :posting_price, :decimal
    add_column :postings, :posting_price, :string
  end
end

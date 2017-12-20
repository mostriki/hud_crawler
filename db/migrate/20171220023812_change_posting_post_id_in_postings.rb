class ChangePostingPostIdInPostings < ActiveRecord::Migration[5.1]
  def change
    change_column :postings, :posting_post_id, :string
  end
end

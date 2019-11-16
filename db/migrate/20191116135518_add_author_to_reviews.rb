class AddAuthorToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :author, :string
  end
end

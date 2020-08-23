class AddReviewTitleToreviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :review_title, :string
  end
end

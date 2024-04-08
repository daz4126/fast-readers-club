class CreateReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :reviews do |t|
      t.belongs_to :book, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true
      t.string :title
      t.text :review
      t.integer :rating

      t.timestamps
    end
  end
end

class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :body
      t.integer :author_id, index: true, foreign_key: true
      t.belongs_to :post, index: true
      t.datetime :published_at

      t.timestamps
    end
  end
end

class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.string :user_id
      t.string :blog_id
      t.string :post_id

      t.timestamps
    end
  end
end

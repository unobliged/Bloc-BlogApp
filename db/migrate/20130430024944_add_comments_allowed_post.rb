class AddCommentsAllowedPost < ActiveRecord::Migration
  def change
    change_table :posts do |t|
      t.boolean :comments_allowed, default: true
    end
    Post.update_all ["comments_allowed = ?", true]
  end
end

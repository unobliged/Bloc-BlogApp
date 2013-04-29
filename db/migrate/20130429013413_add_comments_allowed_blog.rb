class AddCommentsAllowedBlog < ActiveRecord::Migration
  def change
    change_table :blogs do |t|
      t.boolean :comments_allowed, default: true
    end
    Blog.update_all ["comments_allowed = ?", true]
  end
end

class AddAttachmentLogoToBlogs < ActiveRecord::Migration
  def self.up
    change_table :blogs do |t|
      t.attachment :logo
    end
  end

  def self.down
    drop_attached_file :blogs, :logo
  end
end

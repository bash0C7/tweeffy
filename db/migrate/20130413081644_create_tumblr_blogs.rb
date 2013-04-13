class CreateTumblrBlogs < ActiveRecord::Migration
  def change
    create_table :tumblr_blogs do |t|
      t.string :name

      t.timestamps
    end
  end

  def down
    drop_table :tumblr_blogs
  end
end

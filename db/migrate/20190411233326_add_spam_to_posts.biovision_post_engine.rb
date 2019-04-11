# This migration comes from biovision_post_engine (originally 20190202232323)
class AddSpamToPosts < ActiveRecord::Migration[5.2]
  def up
    return if column_exists?(:posts, :spam)

    add_column :posts, :spam, :boolean, default: false, null: false
  end

  def down
    # no rollback
  end
end

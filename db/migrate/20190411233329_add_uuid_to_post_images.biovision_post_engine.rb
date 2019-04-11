# This migration comes from biovision_post_engine (originally 20190224212123)
class AddUuidToPostImages < ActiveRecord::Migration[5.2]
  def up
    return if column_exists?(:post_images, :uuid)
    add_column :post_images, :uuid, :uuid
  end

  def down
    # No rollback needed
  end
end

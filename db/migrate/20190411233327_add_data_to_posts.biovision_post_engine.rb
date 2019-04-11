# frozen_string_literal: true
# This migration comes from biovision_post_engine (originally 20190224212121)

# Add data field for posts table
class AddDataToPosts < ActiveRecord::Migration[5.2]
  def up
    return if column_exists?(:posts, :data)
    add_column :posts, :data, :json, default: {}, null: false
  end

  def down
    # No rollback needed
  end
end

class ChangeColumnTypeForPrimaryTags < ActiveRecord::Migration
  def up
    change_column :posts, :primary_tags, :string
    remove_column :posts, :test_tags
  end

  def down
  end
end

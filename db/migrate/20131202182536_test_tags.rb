class TestTags < ActiveRecord::Migration
  def up
    add_column :posts, :test_tags, :string
  end

  def down
  end
end

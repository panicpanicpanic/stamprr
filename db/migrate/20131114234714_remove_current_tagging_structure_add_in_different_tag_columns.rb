class RemoveCurrentTaggingStructureAddInDifferentTagColumns < ActiveRecord::Migration
  def up
    add_column :posts, :primary_tags, :string, array: true, default: []
    add_column :posts, :secondary_tags, :string, array: true, default: []
  end

  def down
  end
end

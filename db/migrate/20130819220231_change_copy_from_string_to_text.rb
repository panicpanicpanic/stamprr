class ChangeCopyFromStringToText < ActiveRecord::Migration
  def up
    change_column(:posts, :post_copy, :text)
  end

  def down
  end
end

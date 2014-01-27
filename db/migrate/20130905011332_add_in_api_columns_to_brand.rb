class AddInApiColumnsToBrand < ActiveRecord::Migration
  def change
    add_column :brands, :api_id, :string
  end
end

class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :brand_id
      t.string :facebook_link
      t.string :post_copy
      t.datetime :post_date
      t.string :post_total_reach
      t.string :post_total_engagement

      t.timestamps
    end
  end
end

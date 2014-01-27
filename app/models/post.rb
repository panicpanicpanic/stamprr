class Post < ActiveRecord::Base

  attr_accessible :brand_id, :facebook_link, :post_copy, :post_id, :thumbnail_image, :post_date, :post_total_engagement, :post_total_reach, :tag_list, :tag_list_tokens,
                  :primary_tags, :secondary_tags
  acts_as_taggable
  validates :post_id, presence: true, uniqueness: true
  belongs_to :brand

end

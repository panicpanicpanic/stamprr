class Brand < ActiveRecord::Base

  attr_accessible :brand_name, :brand_user_name, :api_id
  has_many :posts

  def self.get_posts
    brands = Brand.all
    brands.each do |b|
      brand_name = b.brand_name
      brand_user_name = b.brand_user_name
      brand_id = b.id
    data_request(brand_name, brand_user_name, brand_id)
    end
  end

  def self.data_request(brand_name, brand_user_name, brand_id)
    data_request = HTTParty.get([PROPRIETARY :)] + brand_user_name + '?access_token=' + ENV['GROUT_ACCESS_TOKEN']).parsed_response
      if data_request.nil?
        puts('Oops! Something is wrong with the Grout API. Go check it out!')
      else
        data_parser(brand_name, brand_user_name, data_request, brand_id)
      end
  end

  def self.data_parser(brand_name, brand_user_name, data_request, brand_id)
    post_data = Hash.new
    data_request.each do |i|
      post_data = {'facebook_link' =>  i['facebook_link'],
                   'post_copy' =>      i['post_copy'],
                   'post_date' =>      i['post_date'],
                   'post_id' =>        i['post_id'],
                   'thumbnail_image'=> i['post_thumbnail']}
    saver(brand_name, brand_user_name, data_request, brand_id, post_data)
    end
  end

  def self.saver(brand_name, brand_user_name, data_request, brand_id, post_data)
    begin
    post = Post.find_or_create_by_post_id(post_data['post_id'])
    post.update_attributes(:brand_id =>             brand_id,
                           :facebook_link =>        post_data['facebook_link'],
                           :post_id =>              post_data['post_id'],
                           :post_copy =>            post_data['post_copy'],
                           :post_date =>            post_data['post_date'],
                           :thumbnail_image =>      post_data['thumbnail_image'])
    rescue
    end
  end


end

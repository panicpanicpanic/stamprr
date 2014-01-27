module Api
  module V1
    class PostsController < ApplicationController
      respond_to :json
      before_filter :only => [:show]

      def show
        data = []
        Brand.find_by_brand_user_name!(params[:id]).posts.order('post_date DESC').limit(450).each do |p|
          tag_data = {'facebook_link' => p['facebook_link'], 'data' => p['post_date'], 'id' => p['post_id'], 'primary_tags' => p.tag_list}
          data << tag_data
        end
        respond_with data
      end

    end
  end
end

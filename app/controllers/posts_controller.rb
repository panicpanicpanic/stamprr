class PostsController < InheritedResources::Base

  def index
    if params[:brand_id]
      @posts = Post.where("brand_id = ?", params[:brand_id]).paginate(:page => params[:page], :per_page => 10).order('post_date DESC')
      @brand_name = Brand.where("id= ?", params[:brand_id])[0].brand_name
    elsif params[:tag]
      @posts = Post.tagged_with(params[:tag]).paginate(:page => params[:page], :per_page => 15).order('post_date DESC')
    elsif
      @posts = Post.paginate(:page => params[:page], :per_page => 10).order('post_date DESC')
    end
  end

  def update
    @post = Post.find(params[:id])
    @post.update_attributes(params[:post])
    redirect_to post_url(@post)
  end

end

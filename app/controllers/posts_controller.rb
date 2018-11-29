class PostsController < ApplicationController
  before_action :find_post, only:[:show, :update]

  def show
  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    @bloggers = Blogger.all
    @destinations = Destination.all
  end

  def create
    @post = Post.create(post_params(:title, :content, :blogger_id, :destination_id))
    if @post.valid?
      @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def like_post
    @post = Post.find(params[:post_id])
    @post.like_post
    redirect_to @post
end

  private
  def find_post
    @post = Post.find(params[:id])
  end

  def post_params(*args)
    params.require(:post).permit(*args)
  end
end

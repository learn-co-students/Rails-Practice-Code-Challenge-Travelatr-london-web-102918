class postsController < ApplicationController

  before_action :set_post, only: [:show, :edit, :update]

  def index
    @posts = post.all
  end

  def new
    @post = post.new
  end

  def create
    @post = post.new(post_params)
    if @post.valid?
      @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end


  private

  def set_post
    @post = post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:first_name, :last_name, :alias, :title, :office, :img_url, :dog_id)
  end

end

class BloggersController < ApplicationController
  before_action :find_blogger, only:[:show]

  def show
  end

  def index
    @bloggers = Blogger.all
  end

  def new
    @blogger = Blogger.new
  end

  def create
    @blogger = Blogger.create(blogger_params(:name, :age, :bio))
    if @blogger.valid?
      @blogger.save
      redirect_to blogger_path(@blogger)
    else
      render :new
    end
  end

  private
  def find_blogger
    @blogger = Blogger.find(params[:id])
  end

  def blogger_params(*args)
    params.require(:blogger).permit(*args)
  end
end

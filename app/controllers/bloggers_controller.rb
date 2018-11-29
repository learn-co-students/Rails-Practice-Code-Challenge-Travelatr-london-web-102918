class bloggersController < ApplicationController

  before_action :set_blogger, only: [:show, :edit, :update]

  def index
    @bloggers = blogger.all
  end

  def new
    @blogger = blogger.new
  end

  def create
    @blogger = blogger.new(blogger_params)
    if @blogger.valid?
      @blogger.save
      redirect_to blogger_path(@blogger)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @blogger.update(blogger_params)
      redirect_to blogger_path(@blogger)
    else
      render :edit
    end
  end


  private

  def set_blogger
    @blogger = blogger.find(params[:id])
  end

  def blogger_params
    params.require(:blogger).permit(:first_name, :last_name, :alias, :title, :office, :img_url, :dog_id)
  end

end

class destinationsController < ApplicationController

  before_action :set_destination, only: [:show, :edit, :update]

  def index
    @destinations = destination.all
  end

  def new
    @destination = destination.new
  end

  def create
    @destination = destination.new(destination_params)
    if @destination.valid?
      @destination.save
      redirect_to destination_path(@destination)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @destination.update(destination_params)
      redirect_to destination_path(@destination)
    else
      render :edit
    end
  end


  private

  def set_destination
    @destination = destination.find(params[:id])
  end

  def destination_params
    params.require(:destination).permit(:first_name, :last_name, :alias, :title, :office, :img_url, :dog_id)
  end

end

class PropertiesController < ApplicationController
  def index
    @properties = Property.all
  end

  def show
    @property = Property.find(params[:id])
    near_stations = Near_station.where(property_id: @property.id).pluck(:near_station_id)
  end

  def new
    @property = Property.new
  end

  def edit
    @property = Property.find(params[:id])
  end

  def create
    
  end

  def destroy
    
  end

  private

  def property_params
    params.require(:property).permit(:name, :rent, :address, :age, :note, )
  end

end

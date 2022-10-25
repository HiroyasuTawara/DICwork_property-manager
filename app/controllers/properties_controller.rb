class PropertiesController < ApplicationController
  def index
    @properties = Property.all
  end

  def show
    @property = Property.find(params[:id])
    near_stations = NearStation.where(property_id: @property.id).pluck(:near_station_id)
  end

  def new
    @property = Property.new
    @property.near_stations.build
  end

  def edit
    @property = Property.find(params[:id])
    @property.near_stations.build
  end

  def create
    @property = Property.new(property_params)
    if @property.save
      redirect_to properties_path, notice: '登録完了'
    else
      @property.near_stations.build
      render :new
    end
  end

  def update
    @property = Property.find(params[:id])
    if @property.update(property_params)
      redirect_to @property, notice: '更新完了'
    else
      return :edit
    end
  end

  def destroy
    @property = Property.find(params[:id])
    @property.destroy
    redirect_to properties_path, notice: '削除完了'
  end

  private

  def property_params
    params.require(:property).permit(
      :name, :rent, :address, :age, :note, 
      near_stations_attributes: [:id, :name, :route, :required_time] 
    )
  end

end

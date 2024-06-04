class HealthRecordsController < ApplicationController
  def index
    @animal = Animal.find(params[:id])
    @healthrecords = HealthRecord.all
  end

  def new
    @animal = Animal.find(params[:id])
    @healthrecord = HealthRecord.new
  end

  def create
    @animal = Animal.find(params[:id])
    @healthrecord = HealthRecord.new(healthrecord_params)
    @healthrecord.save
  end

  def edit
    @healthrecord = HealthRecord.find(params[:id])
  end

  def update
    @healthrecord = HealthRecord.find(params[:id])
    @healthrecord.update(healthrecord_params)
    redirect_to health_record_path(@healthrecord)
  end

  def destroy
    @healthrecord = HealthRecord.find(params[:id])
    @healthrecord.destroy
    redirect_to health_record_path(@healthrecord.animal), status: :see_other
  end

  private

  def healthrecord_params
    params.require(:healthrecord).permit(:history)
  end
end

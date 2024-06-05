class HealthRecordsController < ApplicationController
  before_action :set_record, only: [:update, :destroy]

  def index
    @healthrecords = HealthRecord.all
  end

  def new
    @animal = Animal.find(params[:animal_id])
    @healthrecord = HealthRecord.new
  end

  def create
    @healthrecord = HealthRecord.new(healthrecord_params)
    @healthrecord.animal = @animal

    if @healthrecord.save
      redirect_to @healthrecord, notice: 'Record has been created.'
    else
      render :new
    end
  end

  def edit
    @healthrecord = HealthRecord.find(params[:id])
  end

  def update
    if @healthrecord.update(healthrecord_params)
      redirect_to @healthrecord, notice: 'Record has been updated'
    else
      render :edit
    end
  end

  def destroy
    @healthrecord.destroy
    redirect_to health_record_path(@healthrecord.animal), status: :see_other
  end

  private

  def set_record
    @healthrecord = HealthRecord.find(params[:id])
  end

  def healthrecord_params
    params.require(:healthrecord).permit(:history, :animal_id, :booking_id)
  end
end

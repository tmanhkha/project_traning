# frozen_string_literal: false

class ManufacturersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_manufacturer, only: %i[show edit update destroy]
  before_action :authorize_manufacturer

  def index
    @manufacturers = Manufacturer.all.order(created_at: :desc)
  end

  def show
    setup_presenter
  end

  def new
    @manufacturer = Manufacturer.new
  end

  def edit; end

  def create
    @manufacturer = Manufacturer.new(manufacturer_params)

    respond_to do |format|
      if @manufacturer.save
        format.html { redirect_to @manufacturer, notice: 'Manufacturer was successfully created.' }
        format.json { render :show, status: :created, location: @manufacturer }
      else
        format.html { render :new }
        format.json { render json: @manufacturer.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @manufacturer.update(manufacturer_params)
        format.html { redirect_to @manufacturer, notice: 'Manufacturer was successfully updated.' }
        format.json { render :show, status: :ok, location: @manufacturer }
      else
        format.html { render :edit }
        format.json { render json: @manufacturer.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @manufacturer.destroy
    respond_to do |format|
      format.html { redirect_to manufacturers_url, notice: 'Manufacturer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_manufacturer
    @manufacturer = Manufacturer.find(params[:id])
  end

  def manufacturer_params
    params.require(:manufacturer).permit(:name, models_attributes: %i[id name _destroy])
  end

  def setup_presenter
    @manufacturer_presenter = ManufacturerPresenter.new(view: view_context, manufacturer: @manufacturer)
  end

  def authorize_manufacturer
    authorize Manufacturer
  end
end

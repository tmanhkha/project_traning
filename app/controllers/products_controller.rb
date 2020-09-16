# frozen_string_literal: false

class ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product, only: %i[show edit update destroy]
  before_action :authorize_product

  def index
    @products = Product.all
  end

  def show; end

  def new
    @product = current_user.products.new
    @manufacturers = Manufacturer.all
    @models = Model.none
    @data_memories = DataMemory.none
  end

  def edit
    @manufacturers = Manufacturer.all
    @models = @product.data_memory_model.model.manufacturer.models
    @data_memories = @product.data_memory_model.model.data_memories
  end

  def create
    get_dmm_service = GetDataMemoryModelService.new(params)
    get_dmm_service.execute

    return redirect_to new_product_path, alert: get_dmm_service.errors.join(', ') unless get_dmm_service.errors.empty?

    @product = current_user.products.new(product_params.merge(data_memory_model_id: get_dmm_service.data_memory_model.id))

    respond_to do |format|
      if @product.save
        format.html { redirect_to products_path, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    get_dmm_service = GetDataMemoryModelService.new(params)
    get_dmm_service.execute

    return redirect_to edit_product_path(@product), alert: get_dmm_service.errors.join(', ') unless get_dmm_service.errors.empty?

    respond_to do |format|
      if @product.update(product_params.merge(data_memory_model_id: get_dmm_service.data_memory_model.id))
        format.html { redirect_to products_path, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def models_of_manufacturer
    @manufacturer = Manufacturer.find(params[:manufacturer_id])
    @models = @manufacturer.models

    respond_to do |format|
      format.html
      format.json { render json: @models.map { |model| { id: model.id, text: model.name } } }
    end
  end

  def data_memories_of_model
    @model = Model.find(params[:model_id])
    @data_memories = @model.data_memories

    respond_to do |format|
      format.html
      format.json { render json: @data_memories.map { |data_memory| { id: data_memory.id, text: data_memory.size } } }
    end
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:data_memory_model_id, :price)
  end

  def authorize_product
    authorize Product
  end
end

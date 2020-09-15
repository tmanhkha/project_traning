class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def show
  end

  def new
    @product = current_user.products.new
  end

  def edit
  end

  def create
    data_memory_model = DataMemoryModel.find_by(model_id: params[:model_id], data_memory_id: params[:data_memory_id])
    return redirect_to new_product_path, alert: "Wrong something!" unless data_memory_model.present?

    @product = current_user.products.new(product_params.merge(data_memory_model_id: data_memory_model.id))


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
    respond_to do |format|
      if @product.update(product_params)
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
      format.json { render json: @data_memories.map { |data_memory| { id: data_memory.id, text: data_memory.name } } }
    end
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:data_memory_model_id, :price)
  end
end

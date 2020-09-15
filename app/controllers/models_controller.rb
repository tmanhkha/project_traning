class ModelsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_model, only: [:show, :edit, :update, :destroy]
  before_action :authorize_model

  def index
    setup_presenter
    @models = Model.all
  end


  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @model.update(model_params)
        format.html { redirect_to models_path, notice: 'Model was successfully updated.' }
        format.json { render :show, status: :ok, location: @model }
      else
        format.html { render :edit }
        format.json { render json: @model.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @model.destroy
    respond_to do |format|
      format.html { redirect_to models_url, notice: 'Model was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_model
    @model = Model.find(params[:id])
  end

  def model_params
    params.require(:model).permit(:name, :manufacturer_id, data_memory_ids: [])
  end

  def setup_presenter
    @model_presenter = ModelPresenter.new(view: view_context)
  end

  def authorize_model
    authorize Model
  end
end

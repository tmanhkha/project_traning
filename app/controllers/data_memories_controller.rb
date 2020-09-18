# frozen_string_literal: false

class DataMemoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_data_memory, only: %i[show edit update destroy]
  before_action :authorize_data_memory

  def index
    @data_memories = DataMemory.all.order(size: :asc)
  end

  def show; end

  def new
    @data_memory = DataMemory.new
  end

  def edit; end

  def create
    @data_memory = DataMemory.new(data_memory_params)

    respond_to do |format|
      if @data_memory.save
        format.html { redirect_to @data_memory, notice: 'Data memory was successfully created.' }
        format.json { render :show, status: :created, location: @data_memory }
      else
        format.html { render :new }
        format.json { render json: @data_memory.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @data_memory.update(data_memory_params)
        format.html { redirect_to @data_memory, notice: 'Data memory was successfully updated.' }
        format.json { render :show, status: :ok, location: @data_memory }
      else
        format.html { render :edit }
        format.json { render json: @data_memory.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @data_memory.destroy
    respond_to do |format|
      format.html { redirect_to data_memories_url, notice: 'Data memory was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_data_memory
    @data_memory = DataMemory.find(params[:id])
  end

  def data_memory_params
    params.require(:data_memory).permit(:size)
  end

  def authorize_data_memory
    authorize DataMemory
  end
end

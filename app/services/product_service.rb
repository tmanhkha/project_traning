# frozen_string_literal: false

class ProductService
  attr_accessor :errors, :data_memory_model, :params

  def initialize(params)
    @params = params
    @errors = []
  end

  def execute
    errors.push("Model can't be blank") if params[:model_id].blank?
    errors.push("Data memory can't be blank") if params[:data_memory_id].blank?

    return unless errors.empty?

    find_data_memory_model
  end

  private

  def find_data_memory_model
    @data_memory_model = DataMemoryModel.find_by(model_id: params[:model_id], data_memory_id: params[:data_memory_id])

    errors.push('Wrong something!') if data_memory_model.blank?
  end
end

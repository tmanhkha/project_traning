# frozen_string_literal: false

class ManufacturerPresenter < BasePresenter
  attr_accessor :manufacturer

  def manufacturer_models
    @manufacturer.models.pluck(:name).join(', ')
  end
end

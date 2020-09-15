# frozen_string_literal: false

class ManufacturerPresenter < BasePresenter
  attr_accessor :manufacturer

  def initialize(args = {})
    args.each do |attr, value|
      public_send("#{attr}=", value)
    end
  end

  def manufacturer_models
    @manufacturer.models.pluck(:name).join(', ')
  end
end

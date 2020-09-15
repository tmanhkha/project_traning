# frozen_string_literal: false

class BasePresenter
  attr_accessor :view

  def initialize(args = {})
    args.each do |attr, value|
      public_send("#{attr}=", value)
    end
  end

  def method_missing(*args, &block)
    @view.send(*args, &block) || super
  end

  def respond_to_missing?(method_name, include_private = false)
    super
  end
end

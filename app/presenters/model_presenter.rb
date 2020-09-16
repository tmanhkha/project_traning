# frozen_string_literal: false

class ModelPresenter < BasePresenter
  def intialize(args = {})
    args.each do |attr, value|
      public_send("#{attr}=", value)
    end
  end

  def render_data_memory_label(model)
    html = ''
    model.data_memories.each do |data_memory|
      html += tag.span(data_memory.size, class: 'badge badge-info mr-1')
    end

    html
  end
end

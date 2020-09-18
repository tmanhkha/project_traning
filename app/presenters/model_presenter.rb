# frozen_string_literal: false

class ModelPresenter < BasePresenter
  def render_data_memory_label(model)
    html = ''
    model.data_memories.each do |data_memory|
      html += tag.span(data_memory.size, class: 'badge badge-info mr-1')
    end

    html
  end
end

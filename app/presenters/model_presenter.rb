class ModelPresenter < BasePresenter
  def intialize(args = {})
    args.each do |attr, value|
      public_send("#{attr}=", value)
    end
  end

  def render_data_memory_label(model)
    html = ''
    model.data_memories.each do |data_memory|
      html += content_tag(:span, data_memory.name, class: "badge badge-info mr-1")
    end

    html.html_safe
  end
end

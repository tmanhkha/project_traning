# frozen_string_literal: false

require 'rails_helper'

describe ModelPresenter do
  include ActionView::TestCase::Behavior

  describe 'render_data_memory_label' do
    subject { described_class.new(view: view) }

    let(:model) { create(:model) }
    let(:data_memory) { create(:data_memory) }

    it 'return list empty data memories' do
      expect(subject.render_data_memory_label(model)).to eq('')
    end

    it 'return list data memories' do
      create(:data_memory_model, data_memory: data_memory, model: model)
      expect(subject.render_data_memory_label(model)).to eq("<span class=\"badge badge-info mr-1\">#{data_memory.size}</span>")
    end
  end
end

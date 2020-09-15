require 'rails_helper'

describe ModelPresenter do
  include ActionView::TestCase::Behavior

  describe 'render_data_memory_label' do
    let(:model) { create(:model) }

    it 'return list data memories' do
      mp = described_class.new(view: view)
      expect(mp.render_data_memory_label(model)).to eq('')
    end
  end
end

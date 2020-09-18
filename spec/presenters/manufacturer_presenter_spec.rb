# frozen_string_literal: false

require 'rails_helper'

describe ManufacturerPresenter do
  include ActionView::TestCase::Behavior

  describe 'manufacturer_models' do
    before do
      create(:model, manufacturer_id: manufacturer.id)
      create(:model, name: 'Iphone 8', manufacturer_id: manufacturer.id)
    end

    let(:manufacturer) { create(:manufacturer) }

    it 'return list models of manufacturer' do
      mp = described_class.new(view: view, manufacturer: manufacturer)
      expect(mp.manufacturer_models).to eq('Iphone X, Iphone 8')
    end
  end
end

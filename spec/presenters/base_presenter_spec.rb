# frozen_string_literal: false

require 'rails_helper'

describe BasePresenter do
  include ActionView::TestCase::Behavior

  describe 'methods' do
    it 'should store the view template in the view variable' do
      bp = BasePresenter.new(view: view)
      expect(bp.view).to eq(view)
      expect(bp.respond_to?(:method_miss)).to eq(false)
    end
  end
end

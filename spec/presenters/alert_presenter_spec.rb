# frozen_string_literal: false

require 'rails_helper'

describe AlertPresenter do
  include ActionView::TestCase::Behavior

  describe 'render notice message' do
    it 'notice message not empty' do
      ap = AlertPresenter.new(view: view, notice: 'notice')
      expect(ap.render_header_message).to include('notice alert alert-success')
    end

    it 'notice message empty' do
      ap = AlertPresenter.new(view: view, notice: '')
      expect(ap.render_header_message).to_not include('notice alert alert-success')
    end
  end

  describe 'render alert message' do
    it 'alert message not empty' do
      ap = AlertPresenter.new(view: view, alert: 'alert')
      expect(ap.render_header_message).to include('alert alert-danger')
    end

    it 'alert message empty' do
      ap = AlertPresenter.new(view: view, alert: '')
      expect(ap.render_header_message).to_not include('alert alert-danger')
    end
  end

  describe 'should store notice and alert variable' do
    it 'store view template' do
      ap = AlertPresenter.new(view: view)
      expect(ap.view).to eq(view)
    end

    it 'store notice' do
      ap = AlertPresenter.new(view: view, notice: 'notice')
      expect(ap.notice).to eq('notice')
    end

    it 'store alert' do
      ap = AlertPresenter.new(view: view, notice: 'alert')
      expect(ap.notice).to eq('alert')
    end
  end
end

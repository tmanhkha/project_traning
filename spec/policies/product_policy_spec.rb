# frozen_string_literal: false

require 'rails_helper'

RSpec.describe ProductPolicy, type: :policy do
  subject { ProductPolicy.new(user, product) }

  let(:model) { create(:model) }
  let(:data_memory) { create(:data_memory) }
  let(:data_memory_model) { create(:data_memory_model, model: model, data_memory: data_memory) }
  let(:product) { create(:product, user: user, data_memory_model: data_memory_model) }

  context 'is admin' do
    let(:user) { create(:user, :admin) }

    it { is_expected.to permit_action(:index) }
    it { is_expected.to permit_action(:new) }
    it { is_expected.to permit_action(:create) }
    it { is_expected.to permit_action(:update) }
    it { is_expected.to permit_action(:edit) }
    it { is_expected.to permit_action(:destroy) }
    it { is_expected.to permit_action(:models_of_manufacturer) }
    it { is_expected.to permit_action(:data_memories_of_model) }
  end

  context 'is manager' do
    let(:user) { create(:user, :manager) }

    it { is_expected.to permit_action(:index) }
    it { is_expected.to permit_action(:new) }
    it { is_expected.to permit_action(:create) }
    it { is_expected.to permit_action(:update) }
    it { is_expected.to permit_action(:edit) }
    it { is_expected.to permit_action(:destroy) }
    it { is_expected.to permit_action(:models_of_manufacturer) }
    it { is_expected.to permit_action(:data_memories_of_model) }
  end

  context 'is guest' do
    let(:user) { create(:user, :guest) }

    it { is_expected.to permit_action(:index) }
    it { is_expected.to permit_action(:show) }
    it { is_expected.to forbid_action(:new) }
    it { is_expected.to forbid_action(:create) }
    it { is_expected.to forbid_action(:update) }
    it { is_expected.to forbid_action(:edit) }
    it { is_expected.to forbid_action(:destroy) }
    it { is_expected.to forbid_action(:models_of_manufacturer) }
    it { is_expected.to forbid_action(:data_memories_of_model) }
  end
end

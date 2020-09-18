# frozen_string_literal: false

require 'rails_helper'

RSpec.describe DataMemoryPolicy, type: :policy do
  subject { DataMemoryPolicy.new(user, data_memory) }

  let(:data_memory) { create(:data_memory) }

  context 'is admin' do
    let(:user) { create(:user, :admin) }

    it { is_expected.to permit_action(:index) }
    it { is_expected.to permit_action(:new) }
    it { is_expected.to permit_action(:create) }
    it { is_expected.to permit_action(:update) }
    it { is_expected.to permit_action(:edit) }
    it { is_expected.to permit_action(:destroy) }
  end

  context 'is manager' do
    let(:user) { create(:user, :manager) }

    it { is_expected.to permit_action(:index) }
    it { is_expected.to permit_action(:new) }
    it { is_expected.to permit_action(:create) }
    it { is_expected.to permit_action(:update) }
    it { is_expected.to permit_action(:edit) }
    it { is_expected.to permit_action(:destroy) }
  end

  context 'is guest' do
    let(:user) { create(:user, :guest) }

    it { is_expected.to forbid_action(:index) }
    it { is_expected.to forbid_action(:show) }
    it { is_expected.to forbid_action(:new) }
    it { is_expected.to forbid_action(:create) }
    it { is_expected.to forbid_action(:update) }
    it { is_expected.to forbid_action(:edit) }
    it { is_expected.to forbid_action(:destroy) }
  end
end

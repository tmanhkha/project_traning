# frozen_string_literal: false

require 'rails_helper'

RSpec.describe UserPolicy, type: :policy do
  context 'is admin' do
    subject { UserPolicy.new(user, @account) }
    let(:user) { create(:user, :admin) }

    before(:each) do
      @account = user
    end

    it { is_expected.to permit_action(:index) }
    it { is_expected.to permit_action(:create) }
    it { is_expected.to permit_action(:new) }
    it { is_expected.to permit_action(:update) }
    it { is_expected.to permit_action(:edit) }
    it { is_expected.to permit_action(:destroy) }
  end

  context 'is not admin' do
    subject { UserPolicy.new(user, @account) }
    let(:user) { create(:user) }

    before(:each) do
      @account = user
    end

    it { is_expected.to forbid_action(:index) }
    it { is_expected.to forbid_action(:create) }
    it { is_expected.to forbid_action(:new) }
    it { is_expected.to forbid_action(:update) }
    it { is_expected.to forbid_action(:edit) }
    it { is_expected.to forbid_action(:destroy) }
  end
end

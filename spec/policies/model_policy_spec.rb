require 'rails_helper'

RSpec.describe ModelPolicy, type: :policy do
  subject { UserPolicy.new(user, @model) }

  context 'is admin' do
    let(:user) { create(:user, :admin) }
    let(:model) { create(:model) }

    before(:each) do
      @model = model
    end

    it { is_expected.to permit_action(:index) }
    it { is_expected.to permit_action(:update) }
    it { is_expected.to permit_action(:edit) }
    it { is_expected.to permit_action(:destroy) }
  end

  context 'is guest' do
    let(:user) { create(:user, :guest) }
    let(:model) { create(:model) }

    before(:each) do
      @model = model
    end

    it { is_expected.to forbid_action(:index) }
    it { is_expected.to forbid_action(:show) }
    it { is_expected.to forbid_action(:update) }
    it { is_expected.to forbid_action(:edit) }
    it { is_expected.to forbid_action(:destroy) }
  end
end

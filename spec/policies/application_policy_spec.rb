require 'rails_helper'

describe ApplicationPolicy do
  subject { ApplicationPolicy.new(user, record) }
  let(:resloved_scope) do
    ApplicationPolicy::Scope.new(user, Role.all).resolve
  end
  let(:user) { create(:user) }
  let(:record) { create(:role) }

  context 'default application policy' do
    it { is_expected.to forbid_action(:index) }
    it { is_expected.to forbid_action(:show) }
    it { is_expected.to forbid_action(:create) }
    it { is_expected.to forbid_action(:new) }
    it { is_expected.to forbid_action(:update) }
    it { is_expected.to forbid_action(:edit) }
    it { is_expected.to forbid_action(:destroy) }
  end

  context 'scope' do
    it 'return all recoed with scope' do
      expect(resloved_scope).to eq(Role.all)
    end
  end
end

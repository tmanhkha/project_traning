# frozen_string_literal: false

require 'rails_helper'

RSpec.describe 'Homes', type: :request do
  describe 'GET /index' do
    context 'user not login' do
      it 'returns redirect to login' do
        get '/'
        expect(response).to have_http_status(302)
      end
    end

    context 'user have already login' do
      before do
        @user = create(:user)
        sign_in @user
      end

      it 'return http success' do
        get '/'
        expect(response).to have_http_status(200)
      end
    end
  end
end

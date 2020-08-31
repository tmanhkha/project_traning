# frozen_string_literal: false

require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe 'GET #index' do
    context 'user not login' do
      it 'redirect to login page' do
        get :index
        expect(response).to have_http_status(302)
        expect(response).to redirect_to new_user_session_path
      end
    end

    context 'user have already login' do
      before do
        @user = create(:user)
        sign_in @user
      end

      it 'return home page' do
        get :index
        expect(response).to have_http_status(200)
        expect(response).to render_template(:index)
      end
    end
  end
end

require 'rails_helper'

describe UsersController, type: :controller do
  let(:user) {User.create!(email: "iamiamiam@gmail.com", password: "Rattle1234")}
  let(:useruser) {User.create!(email: "whatever@gmail.com", password: "Rattle1234")}
  describe 'GET #show' do
    context 'when a user is logged in' do
      before do
        sign_in user
      end
      it 'loads correct user details' do
        get :show, params: {id: user.id}
        expect(response).to be_ok
        expect(assigns(:user)).to eq user
      end
    end
    context 'when no user is logged in' do
      it 'redirects to login' do
        get :show, params: {id: user.id}
        expect(response).to redirect_to(new_user_session_path)
      end
    end
    context 'when a user tried to access a different user show page' do
      before do
        sign_in user
      end
      it 'redirects to root path' do
        get :show, params: {id: useruser.id}
        expect(response).to redirect_to(root_path)
      end
    end
  end
end

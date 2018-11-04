require 'rails_helper'

describe ProductsController, type: :controller do
  before do
    @product = FactoryBot.create(:product)
    @user = FactoryBot.create(:user)
    @admin = FactoryBot.create(:admin)
  end
  describe 'Product page is called' do
    context 'when a user requests index page' do
      it 'loads product page successfully' do
        get :index
        expect(response).to be_ok
      end
    end
    context 'when a user requests show page' do
      it 'loads show page successfully' do
        get :show, params: {id: @product.id}
        expect(response).to be_ok
        expect(assigns(:product)).to eq @product
      end
    end
    context 'when a product is created correctly' do
      before :each do
        sign_in @user
      end
      it 'redirects to the new product show page' do
        post :create, product: attributes_for(:product)
        response.should redirect_to product_path
      end
    end
    context 'when a product is deleted' do
      before :each do
        sign_in @admin
      end
      it 'redirects to products index page' do
        delete :destroy, {id: @product.id}
        expect(response).to redirect_to(products_url)
      end
    end
  end
end

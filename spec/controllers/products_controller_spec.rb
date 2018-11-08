require 'rails_helper'

describe ProductsController, type: :controller do
  before do
    @product = FactoryBot.create(:product)
    @user = FactoryBot.create(:user)
    @admin = FactoryBot.create(:admin)
  end
  describe 'GET #index' do
    context 'when a user requests index page' do
      it 'loads product page successfully' do
        get :index
        expect(response).to be_ok
      end
    end
  end

  describe 'GET #show' do
    context 'when a user requests show page' do
      it 'loads show page successfully' do
        get :show, params: {id: @product.id}
        expect(response).to be_ok
        expect(assigns(:product)).to eq @product
      end
    end
  end

  describe 'GET #new' do
    context 'when product new page is requested by admin' do
      before do
        sign_in @admin
      end
      it 'successfully loads the products/new page' do
        get :new
        expect(response).to be_ok
      end
    end
    context 'when product new page is requested by a non-admin user' do
      before do
        sign_in @user
      end
      it 'redirects to root path' do
        get :new
        expect(response).to redirect_to(root_path)
      end
    end
  end

  describe 'POST #create' do
    context 'when a product is created correctly' do
      before do
        sign_in @admin
      end
      it 'increases Product count by 1' do
        expect{
        post :create, params: { product: @product.attributes } }.to change(Product, :count).by(1)
      end
    end
    context 'when a product create attempt is missing a name' do
      before do
        sign_in @admin
      end
      let(:new_product) { FactoryBot.build(:product, name:"") }
      it 'increases Product count by 0' do
        expect{
        post :create, params: { product: new_product.attributes } }.to change(Product, :count).by(0)
      end
    end
  end

 #invoke controller
  describe 'PATCH #update' do
    context 'when a product is correctly updated by an administrator' do
      before do
        sign_in @admin
      end
      let(:updated_product) { FactoryBot.build(:product, name:"new new new") }
      it 'successfully updates product name' do
        put :update, params: { product: updated_product.attributes, id: @product.id}
        expect(Product.first.name).to eq("new new new")
      end
    end
    context 'when a product update attempt is made by a non-administrator' do
      before do
        sign_in @user
      end
      let(:updated_product) { FactoryBot.build(:product, name:"new new new") }
      it 'does not affect any product attributes' do
        expect(Product.first.name).to_not eq("new new new")
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'when a product is deleted' do
      before do
        sign_in @admin
      end
      it 'redirects to products index page' do
        delete :destroy, params: {id: @product.id}
        expect(response).to redirect_to(products_url)
      end
    end
  end

end

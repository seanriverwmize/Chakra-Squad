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

 #invoke cotnroller
  describe 'POST #create' do
    context 'when a product is created correctly' do
      before do
        sign_in @user
      end
      it 'creates a product' do
        @product = FactoryBot.create(:product)
        expect(response).to be_successful
      end
    end
    context 'when a product is not made correctly' do
      it 'does not make a product' do
        expect(Product.new(description: "This is a product without a name")).not_to be_valid
      end
    end
  end

 #invoke controller
  describe 'PATCH #update' do
    context 'when a product is correctly updated' do
      before do
        sign_in @admin
      end
      it 'successfully updates product' do
        @product.update(id: @product.id, name: @product.name, description: "New Description", color: @product.color, image_url: @product.image_url)
        expect(response).to be_successful
        expect(response).to redirect_to(product_url(@product))
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'when a product is deleted' do
      before do
        sign_in @admin
      end
      it 'redirects to products index page' do
        delete(product_url(@product))
        expect(response).to redirect_to(products_url)
      end
    end
  end

end

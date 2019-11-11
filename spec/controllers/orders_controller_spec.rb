require 'rails_helper'


RSpec.describe OrdersController, type: :controller do
  #アソシエーション系の作成（before do をつけると消えるが中身がどうなるかわからないので
  #一旦保留
  #@cart_item = FactoryBot.create_list(:cart_item, 10) 
  
  describe "GET #new" do

    context 'ログインしている時' do
        let(:cart_item) { FactoryBot.create(:cart_item) }
        
        it '変数確認' do 
          puts cart_item.product_id
          puts cart_item.product.stock.product_id

        end
        before do
          session[:user_id] = cart_item.cart.user_id
          
        end

        it 'ログインユーザーにnewが表示されるか' do 
          get :new
          expect(response).to have_http_status(:success)
        end

        it '@cartという変数が正しく定義されているか' do
          cart = Cart.find_by(:user_id => session[:user_id])
          expect(cart_item.cart).to eq cart
        end

        it '@cart_itemsという変数が正しく定義されているか' do
          cart = Cart.find_by(:user_id => session[:user_id])
          cart_items = CartItem.where(cart_id: cart.id)
          expect(cart_item.id).to eq cart_items.ids.first
        end

        it '@cart_sumという変数が正しく定義されているか' do 
          cart = Cart.find_by(:user_id => session[:user_id])
          cart_items = CartItem.where(cart_id: cart.id)
          array = []
          cart_items.each do |item|
            item.quantity = 10
            item.product.price = 100
            array.push(item.quantity * item.product.price)
          end
          cart_sum = array.sum
          expect(cart_sum).to eq 1000

        end

        it '@userに意図したユーザーが入っているかどうか' do
          cart = Cart.find_by(:user_id => session[:user_id])
          user = User.find_by(id: cart.user_id)
          expect(user.id).to eq cart_item.cart.user_id
        end


    end

    context 'ログインしていない場合' do
        it 'ログイン画面にリダイレクトしているか' do
          get :new
          expect(response).to redirect_to login_path
        end

     end

  end

  describe "POST #create" do
    context 'ログインしているが、@cart_itemsが空の時' do
        let(:cart) { FactoryBot.create(:cart) }

        before do
          session[:user_id] = cart.user_id
        end


        it 'cart_itemsが空である時ホーム画面にリダイレクトしているか' do 
          cart = Cart.find_by(:user_id => session[:user_id])
          cart_items = CartItem.where(cart_id: cart.id)

          expect(cart_items.empty?).to be true 
          post :create
          expect(response).to redirect_to root_path
        end


    end

    context 'ログインしていて購入に成功した時' do

        before do
          session[:user_id] = cart_item.cart.user_id
        end

        it '@stockの数が購入数分引かれているか'

        it '@orderの変数が正しく定義されているか'

        it '@stockがデータベースに保存されているか'

        it '@orderがデータベースに保存されているか'

        it '@cartが消されて、cart_itemsの中身が消されているか'

        it 'ホーム画面にリダイレクトされているか'

    end

    context 'ログインしているが、購入数がストックの数より多かった場合' do
      let(:cart_item) { FactoryBot.create(:cart_item) }

      before do
        session[:user_id] = cart_item.cart.user_id
      end

      it '買い物カゴ画面にリダイレクトしているか' do 
        cart_item.quantity = 11
        cart_item.product.stock.stock = 10
        
        post :create
        expect(response).to redirect_to cart_items_path

      end
        
      

    end

    
   
  end





end

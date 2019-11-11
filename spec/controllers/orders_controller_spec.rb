require 'rails_helper'


RSpec.describe OrdersController, type: :controller do
  #アソシエーション系の作成（before do をつけると消えるが中身がどうなるかわからないので
  #一旦保留
  #@cart_item = FactoryBot.create_list(:cart_item, 10) 
  
  describe "GET #new" do

    context 'ログインしている時' do
        stock_amount = 10
        let(:cart_item) { FactoryBot.create(:cart_item) }
        let(:cart) { FactoryBot.create(:cart, user:FactoryBot.create(:user)) }
        let(:cart) { FactoryBot.create(:cart) }
        



        before do
          session[:user_id] = cart_item.cart.user_id
        end

        it 'ログインユーザーにnewが表示されるか' do 
          get :new
          expect(response).to have_http_status(:success)
        end

        it '@cartという変数が正しく定義されているか' do
          @cart = @current_cart
          expect(assigns(:cart)).to eq @cart
        end

        it '@cart_itemsという変数が正しく定義されているか' do
          @cart = @current_cart
          @cart_items = CartItem.where(cart_id: @cart.id)
          expect(assigns(:cart_item)).to eq @cart_items
        end

        it '@cart_sumという変数が正しく定義されているか'

        it '@userに意図したユーザーが入っているかどうか'


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

        it '@cart_itemsが空である'

        it 'ホーム画面にリダイレクトしているか'

    end

    context 'ログインしていて購入に成功した時' do

        it '@stockの変数が正しく定義されているか'

        it '@stockの数が購入数分引かれているか'

        it '@orderの変数が正しく定義されているか'

        it '@stockがデータベースに保存されているか'

        it '@orderがデータベースに保存されているか'

        it '@cartが消されて、cart_itemsの中身が消されているか'

        it 'ホーム画面にリダイレクトされているか'

    end

    context 'ログインしているが、購入数がストックの数より多かった場合' do

        it '買い物カゴ画面にリダイレクトしているか'
      

    end

    
   
  end





end

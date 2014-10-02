require 'rails_helper'

RSpec.describe Admin::UsersController, type: :controller do

  before :each do
    @user = create(:super_admin, email: 'admin@admins.com')
    sign_in @user
  end

  describe 'GET #index' do
    it 'populates an array of all users' do
      user1 = create(:admin)
      user2 = create(:author)
      get :index
      expect(assigns(:admin_users)).to match_array([@user, user1, user2])
    end

    it 'renders the :index template' do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    it 'assigns the requested user to @admin_user' do
      user = create(:admin)
      get :show, id: user
      expect(assigns(:admin_user)).to eq user
    end

    it 'renders the :show template' do
      user = create(:admin)
      get :show, id: user
      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do
    it 'assigns a new user to @admin_user' do
      get :new
      expect(assigns(:admin_user)).to be_a_new(User)
    end

    it 'renders the :new template' do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested user to @admin_user' do
      user = create(:admin)
      get :edit, id: user
      expect(assigns(:admin_user)).to eq user
    end

    it 'renders the :edit template' do
      user = create(:admin)
      get :edit, id: user
      expect(response).to render_template :edit
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'saves the new user in the database' do
        expect do
          post :create, user: attributes_for(:admin)
        end.to change(User, :count).by(1)
      end

      it 'redirects to users#index' do
        post :create, user: attributes_for(:admin)
        expect(response).to redirect_to admin_users_path
      end
    end

    context 'with invalid attributes' do
      it 'does not save the new user in the database' do
        expect do
          post :create, user: attributes_for(:invalid_user)
        end.to_not change(User, :count)
      end

      it 're-renders the :new template' do
        post :create, user: attributes_for(:invalid_user)
        expect(response).to render_template :new
      end
    end
  end

  describe 'PATCH #update' do
    context 'with valid attributes' do
      it 'located the requested @admin_user' do
        patch :update, id: @user, user: attributes_for(:super_admin)
        expect(assigns(:admin_user)).to eq(@user)
      end

      it 'changes the @user attributes' do
        patch :update, id: @user, user: attributes_for(:super_admin, email: 'admin_novo@admins.com')
        @user.reload
        expect(@user.email).to eq('admin_novo@admins.com')
      end

      it 'redirects to users#index' do
        patch :update, id: @user, user: attributes_for(:super_admin)
        expect(response).to redirect_to admin_users_path
      end
    end

    context 'with invalid attributes' do
      it 'does not change the @user attributes' do
        patch :update, id: @user, user: attributes_for(:invalid_user)
        @user.reload
        expect(@user.email).to eq('admin@admins.com')
      end

      it 're-renders the :edit template' do
        patch :update, id: @user, user: attributes_for(:invalid_user)
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE #destroy' do
    before :each do
      @user2 = create(:admin)
    end

    it 'deletes the user' do
      expect do
        delete :destroy, id: @user2
      end.to change(User, :count).by(-1)
    end

    it 'redirects to users#index' do
      delete :destroy, id: @user2
      expect(response).to redirect_to admin_users_url
    end
  end

end

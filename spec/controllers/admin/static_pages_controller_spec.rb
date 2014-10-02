require 'rails_helper'

RSpec.describe Admin::StaticPagesController, type: :controller do

  before :each do
    @user = create(:super_admin, email: 'admin@admins.com')
    sign_in @user
  end

  describe 'GET #index' do
    it 'populates an array of all static pages' do
      static_page1 = create(:static_page)
      static_page2 = create(:static_page)
      get :index
      expect(assigns(:admin_static_pages)).to match_array([static_page1, static_page2])
    end

    it 'renders the :index template' do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    it 'assigns the requested static_page to @admin_static_page' do
      static_page = create(:static_page)
      get :show, id: static_page
      expect(assigns(:admin_static_page)).to eq static_page
    end

    it 'renders the :show template' do
      static_page = create(:static_page)
      get :show, id: static_page
      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do
    it 'assigns a new static page to @admin_static_page' do
      get :new
      expect(assigns(:admin_static_page)).to be_a_new(StaticPage)
    end

    it 'renders the :new template' do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested static_page to @admin_static_page' do
      static_page = create(:static_page)
      get :edit, id: static_page
      expect(assigns(:admin_static_page)).to eq static_page
    end

    it 'renders the :edit template' do
      static_page = create(:static_page)
      get :edit, id: static_page
      expect(response).to render_template :edit
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'saves the new static page in the database' do
        expect do
          post :create, static_page: attributes_for(:static_page)
        end.to change(StaticPage, :count).by(1)
      end

      it 'redirects to static_pages#index' do
        post :create, static_page: attributes_for(:static_page)
        expect(response).to redirect_to admin_static_pages_path
      end
    end

    context 'with invalid attributes' do
      it 'does not save the new static page in the database' do
        expect do
          post :create, static_page: attributes_for(:invalid_static_page)
        end.to_not change(StaticPage, :count)
      end

      it 're-renders the :new template' do
        post :create, static_page: attributes_for(:invalid_static_page)
        expect(response).to render_template :new
      end
    end
  end

  describe 'PATCH #update' do
    before :each do
      @static_page = create(:static_page, title: 'Hello World', body: 'beautiful things')
    end

    context 'with valid attributes' do
      it 'located the requested @static_page' do
        patch :update, id: @static_page, static_page: attributes_for(:static_page)
        expect(assigns(:admin_static_page)).to eq(@static_page)
      end

      it 'changes the @static_page attributes' do
        patch :update, id: @static_page, static_page: attributes_for(:static_page, title: 'Hello World Two', body: 'even more beautiful things')
        @static_page.reload
        expect(@static_page.title).to eq('Hello World Two')
        expect(@static_page.body).to eq('even more beautiful things')
      end

      it 'redirects to static_pages#index' do
        patch :update, id: @static_page, static_page: attributes_for(:static_page)
        expect(response).to redirect_to admin_static_pages_path
      end
    end

    context 'with invalid attributes' do
      it 'title: does not change the @static_page attributes' do
        patch :update, id: @static_page, static_page: attributes_for(:static_page, title: nil, body: 'even more beautiful things')
        @static_page.reload
        expect(@static_page.title).to eq('Hello World')
        expect(@static_page.body).to_not eq('even more beautiful things')
      end

      it 'body: does not change the @static_page attributes' do
        patch :update, id: @static_page, static_page: attributes_for(:static_page, title: 'Hello World Two', body: nil)
        @static_page.reload
        expect(@static_page.title).to_not eq('Hello World Two')
        expect(@static_page.body).to eq('beautiful things')
      end

      it 're-renders the :edit template' do
        patch :update, id: @static_page, static_page: attributes_for(:invalid_static_page)
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE #destroy' do
    before :each do
      @static_page = create(:static_page)
    end

    it 'deletes the static_page' do
      expect do
        delete :destroy, id: @static_page
      end.to change(StaticPage, :count).by(-1)
    end

    it 'redirects to static_pages#index' do
      delete :destroy, id: @static_page
      expect(response).to redirect_to admin_static_pages_url
    end
  end

end

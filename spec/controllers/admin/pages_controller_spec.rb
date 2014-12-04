require 'rails_helper'

RSpec.describe Admin::PagesController, type: :controller do

  before :each do
    @user = create(:super_admin, email: 'admin@admins.com')
    sign_in @user
  end

  describe 'GET #index' do
    it 'populates an array of all pages' do
      page1 = create(:page)
      page2 = create(:page)
      get :index
      expect(assigns(:admin_pages)).to match_array([page1, page2])
    end

    it 'renders the :index template' do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    it 'assigns the requested page to @page' do
      page = create(:page)
      get :show, id: page
      expect(assigns(:admin_page)).to eq page
    end

    it 'renders the :show template' do
      page = create(:page)
      get :show, id: page
      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do
    it 'assigns a new page to @page' do
      get :new
      expect(assigns(:admin_page)).to be_a_new(Page)
    end

    it 'renders the :new template' do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested page to @page' do
      page = create(:page)
      get :edit, id: page
      expect(assigns(:admin_page)).to eq page
    end

    it 'renders the :edit template' do
      page = create(:page)
      get :edit, id: page
      expect(response).to render_template :edit
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'saves the new page in the database' do
        expect do
          post :create, page: attributes_for(:page)
        end.to change(Page, :count).by(1)
      end

      it 'redirects to Pages#index' do
        post :create, page: attributes_for(:page)
        expect(response).to redirect_to admin_pages_path
      end
    end

    context 'with invalid attributes' do
      it 'does not save the new page in the database' do
        expect do
          post :create, page: attributes_for(:invalid_page)
        end.to_not change(Page, :count)
      end

      it 're-renders the :new template' do
        post :create, page: attributes_for(:invalid_page)
        expect(response).to render_template :new
      end
    end
  end

  describe 'PATCH #update' do
    before :each do
      @page = create(:page, title: 'Hello World', body: 'beautiful things')
    end

    context 'with valid attributes' do
      it 'located the requested @page' do
        patch :update, id: @page, page: attributes_for(:page)
        expect(assigns(:admin_page)).to eq(@page)
      end

      it 'changes the @page attributes' do
        patch :update, id: @page, page: attributes_for(:page, title: 'Hello World Two', body: 'even more beautiful things')
        @page.reload
        expect(@page.title).to eq('Hello World Two')
        expect(@page.body).to eq('even more beautiful things')
      end

      it 'redirects to Pages#index' do
        patch :update, id: @page, page: attributes_for(:page)
        expect(response).to redirect_to admin_pages_path
      end
    end

    context 'with invalid attributes' do
      it 'title: does not change the @page attributes' do
        patch :update, id: @page, page: attributes_for(:page, title: nil, body: 'even more beautiful things')
        @page.reload
        expect(@page.title).to eq('Hello World')
        expect(@page.body).to_not eq('even more beautiful things')
      end

      it 'body: does not change the @page attributes' do
        patch :update, id: @page, page: attributes_for(:page, title: 'Hello World Two', body: nil)
        @page.reload
        expect(@page.title).to_not eq('Hello World Two')
        expect(@page.body).to eq('beautiful things')
      end

      it 're-renders the :edit template' do
        patch :update, id: @page, page: attributes_for(:invalid_page)
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE #destroy' do
    before :each do
      @page = create(:page)
    end

    it 'deletes the page' do
      expect do
        delete :destroy, id: @page
      end.to change(Page, :count).by(-1)
    end

    it 'redirects to Pages#index' do
      delete :destroy, id: @page
      expect(response).to redirect_to admin_pages_url
    end
  end

end

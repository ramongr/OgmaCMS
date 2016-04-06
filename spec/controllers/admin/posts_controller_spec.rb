require 'rails_helper'

RSpec.describe Admin::PostsController, type: :controller do

  before :each do
    @user = create(:super_admin, email: 'admin@admins.com')
    sign_in @user
  end

  describe 'GET #index' do
    it 'populates an array of all posts' do
      post1 = create(:post)
      post2 = create(:post)
      get :index
      expect(assigns(:admin_posts)).to match_array([post1, post2])
    end

    it 'renders the :index template' do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    it 'assigns the requested post to @post' do
      post = create(:post)
      get :show, id: post
      expect(assigns(:admin_post)).to eq post
    end

    it 'renders the :show template' do
      post = create(:post)
      get :show, id: post
      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do
    it 'assigns a post user to @post' do
      get :new
      expect(assigns(:admin_post)).to be_a_new(Post)
    end

    it 'renders the :new template' do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested post to @post' do
      post = create(:post)
      get :edit, id: post
      expect(assigns(:admin_post)).to eq post
    end

    it 'renders the :edit template' do
      post = create(:post)
      get :edit, id: post
      expect(response).to render_template :edit
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'saves the new post in the database' do
        expect do
          post :create, post: attributes_for(:post)
        end.to change(Post, :count).by(1)
      end

      it 'redirects to post#index' do
        post :create, post: attributes_for(:post)
        expect(response).to redirect_to admin_posts_url
      end
    end

    context 'with invalid attributes' do
      it 'does not save the new post in the database' do
        expect do
          post :create, post: attributes_for(:invalid_post)
        end.to_not change(Post, :count)
      end

      it 're-renders the :new template' do
        post :create, post: attributes_for(:invalid_post)
        expect(response).to render_template :new
      end
    end
  end

  describe 'PATCH #update' do
    before :each do
      @post = create(:post, title: 'Ola', content: 'Cenas maradas e tal')
    end

    context 'with valid attributes' do
      it 'located the requested @post' do
        patch :update, id: @post, post: attributes_for(:post)
        expect(assigns(:admin_post)).to eq(@post)
      end

      it 'changes the @post attributes' do
        patch :update, id: @post, post: attributes_for(:post, title: 'Ola Editado')
        @post.reload
        expect(@post.title).to eq('Ola Editado')
      end

      it 'redirects to posts#index' do
        patch :update, id: @post, post: attributes_for(:post)
        expect(response).to redirect_to admin_posts_url
      end
    end

    context 'with invalid attributes' do
      it 'does not change the @post attributes' do
        patch :update, id: @post, post: attributes_for(:invalid_post)
        @post.reload
        expect(@post.title).to eq('Ola')
      end

      it 're-renders the :edit template' do
        patch :update, id: @post, post: attributes_for(:invalid_post)
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE #destroy' do
    before :each do
      @post = create(:post)
    end

    it 'deletes the user' do
      expect do
        delete :destroy, id: @post
      end.to change(Post, :count).by(-1)
    end

    it 'redirects to users#index' do
      delete :destroy, id: @post
      expect(response).to redirect_to admin_posts_url
    end
  end

end

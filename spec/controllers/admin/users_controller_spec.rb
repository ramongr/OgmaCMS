require 'rails_helper'

RSpec.describe Admin::UsersController, :type => :controller do
  
  describe "GET #index" do
    it "populates an array of all users" do
      user1 = create(:user)
      user2 = create(:user)
      get :index
      expect(assigns(:admin_users)).to match_array([user1, user2])
    end

    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "GET #show" do
    it "assigns the requested user to @admin_user" do
      user = create(:user)
      get :show, id: user
      expect(assigns(:admin_user)).to eq user
    end

    it "renders the :show template" do
      user = create(:user)
      get :show, id: user
      expect(response).to render_template :show
    end
  end

  describe "GET #new" do
    it "assigns a new user to @admin_user" do
      get :new
      expect(assigns(:admin_user)).to be_a_new(User)
    end

    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "GET #edit" do
    it "assigns the requested user to @admin_user" do
      user = create(:user)
      get :edit, id: user
      expect(assigns(:admin_user)).to eq user
    end

    it "renders the :edit template" do
      user = create(:user)
      get :edit, id: user
      expect(response).to render_template :edit
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new user in the database" do
        expect{
          post :create, user: attributes_for(:user)
        }.to change(User, :count).by(1)
      end

      it "redirects to users#index" do
        post :create, user: attributes_for(:user)
        expect(response).to redirect_to admin_users_path
      end
    end

    context "with invalid attributes" do
      it "does not save the new user in the database" do
        expect{
          post :create, user: attributes_for(:invalid_user)
        }.to_not change(User, :count)
      end

      it "re-renders the :new template" do
        post :create, user: attributes_for(:invalid_user)
        expect(response).to render_template :new
      end
    end
  end

  describe "PATCH #update" do
    before :each do
      @user = create(:user, email: "admin@admins.com")
      sign_in @user
    end

    context "with valid attributes" do
      it "located the requested @admin_user" do
        patch :update, id: @user, user: attributes_for(:user)
        expect(assigns(:admin_user)).to eq(@user)
      end

      it "changes the @user attributes" do
        patch :update, id: @user, user: attributes_for(:user, email: "admin_novo@admins.com")
        @user.reload
        expect(@user.email).to eq("admin_novo@admins.com")
      end

      it "redirects to users#index" do
        patch :update, id: @user, user: attributes_for(:user)
        expect(response).to redirect_to admin_users_path
      end
    end

    context "with invalid attributes" do
      it "does not change the @user attributes" do
      	patch :update, id: @user, user: attributes_for(:invalid_user)
        @user.reload
        expect(@user.email).to eq("admin@admins.com")
      end

      it "re-renders the :edit template" do
      	patch :update, id: @user, user: attributes_for(:invalid_user)
        expect(response).to render_template :edit
      end
    end
  end

  describe "DELETE #destroy" do
    before :each do
      @user = create(:user)
    end

    it "deletes the user" do
      expect{
        delete :destroy, id: @user
      }.to change(User, :count).by(-1)
    end

    it "redirects to users#index" do
      delete :destroy, id: @user
      expect(response).to redirect_to admin_users_url
    end
  end

end

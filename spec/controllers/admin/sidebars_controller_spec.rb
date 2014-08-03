require 'rails_helper'

RSpec.describe Admin::SidebarsController, :type => :controller do

  describe "GET #index" do
    it "populates an array of all sidebars" do
      sidebar1 = create(:left_sidebar)
      sidebar2 = create(:right_sidebar)
      sidebar3 = create(:top_sidebar)
      sidebar4 = create(:bottom_sidebar)
      get :index
      expect(assigns(:sidebars)).to match_array([sidebar1, sidebar2, sidebar3, sidebar4])
    end

    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "GET #show" do
    it "assigns the requested sidebar to @sidebar" do
      sidebar = create(:left_sidebar)
      get :show, id: sidebar
      expect(assigns(:sidebar)).to eq sidebar
    end

    it "renders the :show template" do
      sidebar = create(:left_sidebar)
      get :show, id: sidebar
      expect(response).to render_template :show
    end
  end

  describe "GET #new" do
    it "assigns a new sidebar to @sidebar" do
      get :new
      expect(assigns(:sidebar)).to be_a_new(Sidebar)
    end

    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "GET #edit" do
    it "assigns the requested sidebar to @sidebar" do
      sidebar = create(:left_sidebar)
      get :edit, id: sidebar
      expect(assigns(:sidebar)).to eq sidebar
    end

    it "renders the :edit template" do
      sidebar = create(:left_sidebar)
      get :edit, id: sidebar
      expect(response).to render_template :edit
    end
  end

  describe "POST #create" do
    before :each do
      @static_pages = [attributes_for(:static_page)]
    end

    context "with valid attributes" do
      it "saves the new sidebar in the database" do
        expect{
          post :create, sidebar: attributes_for(:left_sidebar)
        }.to change(Sidebar, :count).by(1)
      end

      it "redirects to sidebar#show" do
        post :create, sidebar: attributes_for(:left_sidebar)
        expect(response).to redirect_to admin_sidebar_path(assigns(:sidebar))
      end
    end

    context "with invalid attributes" do
      it "does not save the new sidebar in the database" do
        expect{
          post :create, sidebar: attributes_for(:invalid_sidebar)
        }.to_not change(Sidebar, :count)
      end

      it "re-renders the :new template" do
        post :create, sidebar: attributes_for(:invalid_sidebar)
        expect(response).to render_template :new
      end
    end
  end

  describe "PATCH #update" do
    before :each do
      @sidebar = create(:left_sidebar, title: "Hello World")
    end

    context "with valid attributes" do
      it "located the requested @sidebar" do
        patch :update, id: @sidebar, sidebar: attributes_for(:left_sidebar)
        expect(assigns(:sidebar)).to eq(@sidebar)
      end

      it "changes the @sidebar attributes" do
        patch :update, id: @sidebar, sidebar: attributes_for(:left_sidebar, title: "Hello World Two")
        @sidebar.reload
        expect(@sidebar.title).to eq("Hello World Two")
      end

      it "redirects to sidebar#show" do
        patch :update, id: @sidebar, sidebar: attributes_for(:left_sidebar)
        expect(response).to redirect_to admin_sidebar_path(assigns(:sidebar))
      end
    end

    context "with invalid attributes" do
      it "does not change the @sidebar attributes" do
      	patch :update, id: @sidebar, sidebar: attributes_for(:invalid_sidebar)
        @sidebar.reload
        expect(@sidebar.title).to eq("Hello World")
      end

      it "re-renders the :edit template" do
      	patch :update, id: @sidebar, sidebar: attributes_for(:invalid_sidebar)
        expect(response).to render_template :edit
      end
    end
  end

  describe "DELETE #destroy" do
    before :each do
      @sidebar = create(:left_sidebar)
    end

    it "deletes the sidebar" do
      expect{
        delete :destroy, id: @sidebar
      }.to change(Sidebar, :count).by(-1)
    end

    it "redirects to sidebar#index" do
      delete :destroy, id: @sidebar
      expect(response).to redirect_to admin_sidebars_url
    end
  end

end

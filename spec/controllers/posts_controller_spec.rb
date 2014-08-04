require 'rails_helper'

RSpec.describe PostsController, :type => :controller do

  describe "GET #index" do
    it "populates an array of all posts" do
      post1 = create(:post)
      post2 = create(:post)
      get :index
      expect(assigns(:posts)).to match_array([post1, post2])
    end

    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "GET #show" do
    it "assigns the requested post to @post" do
      post = create(:post)
      get :show, id: post
      expect(assigns(:post)).to eq post
    end

    it "renders the :show template" do
      post = create(:post)
      get :show, id: post
      expect(response).to render_template :show
    end
  end

end

require 'rails_helper'

RSpec.describe PagesController, :type => :controller do

  describe "GET #show" do
    it "assigns the requested static_page to @page" do
      static_page = create(:static_page)
      get :show, id: static_page
      expect(assigns(:page)).to eq static_page
    end

    it "renders the :show template" do
      static_page = create(:static_page)
      get :show, id: static_page
      expect(response).to render_template :show
    end
  end

end

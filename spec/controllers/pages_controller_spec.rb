require 'rails_helper'

RSpec.describe PagesController, type: :controller do

  describe 'GET #show' do
    it 'assigns the requested page to @page' do
      page = create(:page)
      get :show, id: page
      expect(assigns(:page)).to eq page
    end

    it 'renders the :show template' do
      page = create(:page)
      get :show, id: page
      expect(response).to render_template :show
    end
  end

end

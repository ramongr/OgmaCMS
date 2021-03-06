require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe VisitorCommentsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # VisitorComment. As you add validations to VisitorComment, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    skip('Add a hash of attributes valid for your model')
  end

  let(:invalid_attributes) do
    skip('Add a hash of attributes invalid for your model')
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # VisitorCommentsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe 'GET index' do
    it 'assigns all visitor_comments as @visitor_comments' do
      visitor_comment = VisitorComment.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:visitor_comments)).to eq([visitor_comment])
    end
  end

  describe 'GET show' do
    it 'assigns the requested visitor_comment as @visitor_comment' do
      visitor_comment = VisitorComment.create! valid_attributes
      get :show, { id: visitor_comment.to_param }, valid_session
      expect(assigns(:visitor_comment)).to eq(visitor_comment)
    end
  end

  describe 'GET new' do
    it 'assigns a new visitor_comment as @visitor_comment' do
      get :new, {}, valid_session
      expect(assigns(:visitor_comment)).to be_a_new(VisitorComment)
    end
  end

  describe 'GET edit' do
    it 'assigns the requested visitor_comment as @visitor_comment' do
      visitor_comment = VisitorComment.create! valid_attributes
      get :edit, { id: visitor_comment.to_param }, valid_session
      expect(assigns(:visitor_comment)).to eq(visitor_comment)
    end
  end

  describe 'POST create' do
    describe 'with valid params' do
      it 'creates a new VisitorComment' do
        expect do
          post :create, { visitor_comment: valid_attributes }, valid_session
        end.to change(VisitorComment, :count).by(1)
      end

      it 'assigns a newly created visitor_comment as @visitor_comment' do
        post :create, { visitor_comment: valid_attributes }, valid_session
        expect(assigns(:visitor_comment)).to be_a(VisitorComment)
        expect(assigns(:visitor_comment)).to be_persisted
      end

      it 'redirects to the created visitor_comment' do
        post :create, { visitor_comment: valid_attributes }, valid_session
        expect(response).to redirect_to(VisitorComment.last)
      end
    end

    describe 'with invalid params' do
      it 'assigns a newly created but unsaved visitor_comment as @visitor_comment' do
        post :create, { visitor_comment: invalid_attributes }, valid_session
        expect(assigns(:visitor_comment)).to be_a_new(VisitorComment)
      end

      it "re-renders the 'new' template" do
        post :create, { visitor_comment: invalid_attributes }, valid_session
        expect(response).to render_template('new')
      end
    end
  end

  describe 'PUT update' do
    describe 'with valid params' do
      let(:new_attributes) do
        skip('Add a hash of attributes valid for your model')
      end

      it 'updates the requested visitor_comment' do
        visitor_comment = VisitorComment.create! valid_attributes
        put :update, { id: visitor_comment.to_param, visitor_comment: new_attributes }, valid_session
        visitor_comment.reload
        skip('Add assertions for updated state')
      end

      it 'assigns the requested visitor_comment as @visitor_comment' do
        visitor_comment = VisitorComment.create! valid_attributes
        put :update, { id: visitor_comment.to_param, visitor_comment: valid_attributes }, valid_session
        expect(assigns(:visitor_comment)).to eq(visitor_comment)
      end

      it 'redirects to the visitor_comment' do
        visitor_comment = VisitorComment.create! valid_attributes
        put :update, { id: visitor_comment.to_param, visitor_comment: valid_attributes }, valid_session
        expect(response).to redirect_to(visitor_comment)
      end
    end

    describe 'with invalid params' do
      it 'assigns the visitor_comment as @visitor_comment' do
        visitor_comment = VisitorComment.create! valid_attributes
        put :update, { id: visitor_comment.to_param, visitor_comment: invalid_attributes }, valid_session
        expect(assigns(:visitor_comment)).to eq(visitor_comment)
      end

      it "re-renders the 'edit' template" do
        visitor_comment = VisitorComment.create! valid_attributes
        put :update, { id: visitor_comment.to_param, visitor_comment: invalid_attributes }, valid_session
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'DELETE destroy' do
    it 'destroys the requested visitor_comment' do
      visitor_comment = VisitorComment.create! valid_attributes
      expect do
        delete :destroy, { id: visitor_comment.to_param }, valid_session
      end.to change(VisitorComment, :count).by(-1)
    end

    it 'redirects to the visitor_comments list' do
      visitor_comment = VisitorComment.create! valid_attributes
      delete :destroy, { id: visitor_comment.to_param }, valid_session
      expect(response).to redirect_to(visitor_comments_url)
    end
  end

end

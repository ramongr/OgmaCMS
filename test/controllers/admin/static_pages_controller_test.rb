require 'test_helper'

class Admin::StaticPagesControllerTest < ActionController::TestCase
  setup do
    @admin_static_page = admin_static_pages(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_static_pages)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create admin_static_page' do
    assert_difference('Admin::StaticPage.count') do
      post :create, admin_static_page: { body: @admin_static_page.body, slug: @admin_static_page.slug, title: @admin_static_page.title }
    end

    assert_redirected_to admin_static_page_path(assigns(:admin_static_page))
  end

  test 'should show admin_static_page' do
    get :show, id: @admin_static_page
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @admin_static_page
    assert_response :success
  end

  test 'should update admin_static_page' do
    patch :update, id: @admin_static_page, admin_static_page: { body: @admin_static_page.body, slug: @admin_static_page.slug, title: @admin_static_page.title }
    assert_redirected_to admin_static_page_path(assigns(:admin_static_page))
  end

  test 'should destroy admin_static_page' do
    assert_difference('Admin::StaticPage.count', -1) do
      delete :destroy, id: @admin_static_page
    end

    assert_redirected_to admin_static_pages_path
  end
end

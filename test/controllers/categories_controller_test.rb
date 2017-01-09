require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase

  def setup
    @category = Category.create(name: "Sports") 
    @user = User.create(username: "john", email: "john@example.com", password: "password", admin: true)
  end
    
  test "Testing new action" do
    session[:user_id] = @user.id
    get :new
    assert_response :success
  end
  
  test "Testing index action" do 
    get :index
    assert_response :success
  end
  
  test "Testing show action" do 
    get(:index, {:id => @category.id})
    assert_response :success
  end
  
  test "Should redirect to create when user not logged in" do 
  assert_no_difference 'Category.count' do
    post :create, category: {name: "sports"} 
  end  
  assert_redirected_to categories_path
  end
  
  
end
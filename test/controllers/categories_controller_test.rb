require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase

  def setup
    @category = Category.create(id: "Sports")  
  end
    
  test "Testing new action" do
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
  
end
require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  def setup
    @base_title = "Budget App"
  end
  
  test "should get home" do
    get :home
    assert_response :success
    assert_select 'title', :text => "#{@base_title}"
  end
end

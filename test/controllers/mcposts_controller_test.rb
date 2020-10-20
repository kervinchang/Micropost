require 'test_helper'

class McpostsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  def setup
    @mcpost = mcposts(:orange)
  end

  test "should redirected create when not logged in" do
    assert_no_difference 'Mcpost.count' do
      post mcposts_path, params: { mcpost: { content: "Lorem ipsum" } }
    end
    assert_redirected_to login_url
  end

  test "should redirected destroy when not logged in" do
    assert_no_difference 'Mcpost.count' do
      delete mcpost_path(@mcpost)
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy for wrong micropost" do
    log_in_as(users(:michael))
    mcpost = mcposts(:ants)
    assert_no_difference 'Mcpost.count' do
      delete mcpost_path(mcpost)
    end
    assert_redirected_to root_url
  end
end

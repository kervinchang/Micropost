require 'test_helper'

class McpostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = users(:michael)
    # @mcpost = Mcpost.new(content: "Lorem ipsum", user_id: @user.id)
    @mcpost = @user.mcposts.build(content: "Lorem ipsum")
  end

  test "should be valid" do
    assert @mcpost.valid?
  end

  test "user id should be present" do
    @mcpost.user_id = nil
    assert_not @mcpost.valid?
  end

  test "content should be present" do
    @mcpost.content = "   "
    assert_not @mcpost.valid?
  end

  test "content should be at most 140 characters" do
    @mcpost.content = "a" * 141
    assert_not @mcpost.valid?
  end

  test "order should be most recent first" do
    assert_equal mcposts(:most_recent), Mcpost.first
  end
end

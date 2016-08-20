require 'spec_helper'

RSpec.describe "followers/new", type: :view do
  before(:each) do
    assign(:follower, Follower.new(
      :user => nil,
      :follower_id => 1
    ))
  end

  it "renders new follower form" do
    render

    assert_select "form[action=?][method=?]", followers_path, "post" do

      assert_select "input#follower_user_id[name=?]", "follower[user_id]"

      assert_select "input#follower_follower_id[name=?]", "follower[follower_id]"
    end
  end
end

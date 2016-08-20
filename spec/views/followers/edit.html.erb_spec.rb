require 'rails_helper'

RSpec.describe "followers/edit", type: :view do
  before(:each) do
    @follower = assign(:follower, Follower.create!(
      :user => nil,
      :follower_id => 1
    ))
  end

  it "renders the edit follower form" do
    render

    assert_select "form[action=?][method=?]", follower_path(@follower), "post" do

      assert_select "input#follower_user_id[name=?]", "follower[user_id]"

      assert_select "input#follower_follower_id[name=?]", "follower[follower_id]"
    end
  end
end

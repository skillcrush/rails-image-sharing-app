require 'spec_helper'

RSpec.describe "followers/index", type: :view do
  before(:each) do
    assign(:followers, [
      Follower.create!(
        :user => nil,
        :follower_id => 2
      ),
      Follower.create!(
        :user => nil,
        :follower_id => 2
      )
    ])
  end

  it "renders a list of followers" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end

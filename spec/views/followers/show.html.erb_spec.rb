require 'rails_helper'

RSpec.describe "followers/show", type: :view do
  before(:each) do
    @follower = assign(:follower, Follower.create!(
      :user => nil,
      :follower_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
  end
end

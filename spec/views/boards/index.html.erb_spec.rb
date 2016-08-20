require 'rails_helper'

RSpec.describe "boards/index", type: :view do
  before(:each) do
    assign(:boards, [
      Board.create!(
        :name => "Name",
        :user => nil
      ),
      Board.create!(
        :name => "Name",
        :user => nil
      )
    ])
  end

  it "renders a list of boards" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end

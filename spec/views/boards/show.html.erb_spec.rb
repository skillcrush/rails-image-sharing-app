require 'spec_helper'

RSpec.describe "boards/show", type: :view do
  before(:each) do
    @user = FactoryGirl.create(:user)
    @board = @user.boards.first
    @pins = @board.pins
    login(@user)
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(//)
  end
end

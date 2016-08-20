require 'spec_helper'

RSpec.describe "boards/new", type: :view do
  before(:each) do
    @user = FactoryGirl.create(:user)
    assign(:board, Board.new(
      :name => "MyString",
      :user => @user
    ))
    login(@user)
  end

  it "renders new board form" do
    render

    assert_select "form[action=?][method=?]", boards_path, "post" do

      assert_select "input#board_name[name=?]", "board[name]"

      assert_select "input#board_user_id[name=?]", "board[user_id]"
    end
  end
end

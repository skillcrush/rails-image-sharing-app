require 'rails_helper'

RSpec.describe "boards/edit", type: :view do
  before(:each) do
    @board = assign(:board, Board.create!(
      :name => "MyString",
      :user => nil
    ))
  end

  it "renders the edit board form" do
    render

    assert_select "form[action=?][method=?]", board_path(@board), "post" do

      assert_select "input#board_name[name=?]", "board[name]"

      assert_select "input#board_user_id[name=?]", "board[user_id]"
    end
  end
end

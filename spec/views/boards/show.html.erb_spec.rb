require 'rails_helper'

RSpec.describe "boards/show", type: :view do
  before(:each) do
    @board = assign(:board, Board.create!(
      :name => "Name",
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(//)
  end
end

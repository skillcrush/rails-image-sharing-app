class CreateBoardPinners < ActiveRecord::Migration
  def change
    create_table :board_pinners do |t|
      t.references :user, index: true
      t.references :board, index: true

      t.timestamps null: false
    end
    add_foreign_key :board_pinners, :users
    add_foreign_key :board_pinners, :boards
  end
end

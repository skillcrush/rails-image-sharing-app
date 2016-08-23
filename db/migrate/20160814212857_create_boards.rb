class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      t.string :name
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :boards, :users
    add_reference :pinnings, :board, index: true

    User.all.each do |user|
    	board = user.boards.create(name: "My Pins!")
    	user.pinnings.each do |pinning|
    		board.pinnings << pinning
    	end
    end
  end
end

class CreatePinnings < ActiveRecord::Migration
  def change
    create_table :pinnings do |t|
      t.references :user, index: true
      t.references :pin, index: true
      t.timestamps
    end
    add_foreign_key :pinnings, :users
    add_foreign_key :pinnings, :pins

Pin.where("user_id is NOT null").each do |pin|
	puts "got pin #{pin.id}"
	user = User.find(pin.user_id)
	if user.present?
		puts "user present: #{user.id}"
		pin.pinnings.create(user: user)
	end
end
  end
end

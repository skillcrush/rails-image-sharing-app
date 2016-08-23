class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
    end

    add_column :pins, :category_id, :integer, references: :categories
    add_index :pins, :category_id
    
    if Category.all.empty?
      Category.create(name: "ruby")
      Category.create(name: "rails")
      Category.create(name: "unknown")
    end
    
    unknown_category = Category.find_by_name("unknown")
    pins = Pin.where("category_id is null")
    
    pins.each do |pin|
      category = Category.find_by_name(pin.resource_type)
      if category.present?
        pin.category_id = category.id
      else
        pin.category_id = unknown_category.id
      end
      pin.save
    end
    
    if Pin.where("category_id is null").empty?
      remove_column :pins, :resource_type
      puts "MIGRATION SUCCESSFUL!"
      puts "All your data has been migrated successfully."      
    else
      puts "ERROR! Something went wrong - not all pins have been assigned a category Id."
    end
  end
end

class CreatePhysicians < ActiveRecord::Migration
  def change
    create_table :physicians do |t|
      t.string :name
      t.text :address
    end
  end
end

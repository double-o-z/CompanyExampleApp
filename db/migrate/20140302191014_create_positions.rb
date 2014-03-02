class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.string :desc
      t.integer :salary

    end
  end
end

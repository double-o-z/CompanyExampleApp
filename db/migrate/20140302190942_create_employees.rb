class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name
      t.integer :position
      t.date :start_date
      t.date :end_date

    end
  end
end

class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.column :name, :string
      t.column :start_date, :date
      t.column :end_date, :date
    end
  end
end

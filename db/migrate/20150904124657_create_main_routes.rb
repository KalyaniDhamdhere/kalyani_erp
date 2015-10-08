class CreateMainRoutes < ActiveRecord::Migration
  def change
    create_table :main_routes do |t|
      t.string :route_name
      t.decimal :cost

      t.timestamps null: false
    end
  end
end

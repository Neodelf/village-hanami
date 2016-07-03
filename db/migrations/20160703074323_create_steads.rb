Hanami::Model.migration do
  change do
  	create_table :steads do
  	  primary_key :id
      column :cost_square_meter, Integer, null: true
      column :serial_number, Integer, null: false
      column :total_area, Integer, null: false
      column :description, String, text: true, null: false
    end
  end
end

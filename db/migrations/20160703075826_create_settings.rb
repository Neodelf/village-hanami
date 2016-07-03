Hanami::Model.migration do
  change do
  	create_table :settings do
  	  column :default_cost_square_meter, Integer, null: true, default: 450
  	end
  end
end

Hanami::Model.migration do
  change do
    create_table :order_calls do
      primary_key :id
      column :name, String, null: false, size: 256
      column :phone, String, null: false, size: 18
      column :comment, String, text: true, null: false
    end
  end
end

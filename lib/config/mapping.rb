collection :order_calls do
  entity     OrderCall
  repository OrderCallRepository

  attribute :id,   Integer
  attribute :name, String
  attribute :phone_number, String
  attribute :comment, String
end

collection :steads do
  entity     Stead
  repository SteadRepository

  attribute :id, Integer
  attribute :cost_square_meter, Integer
  attribute :serial_number, Integer
  attribute :total_area, Integer
  attribute :description, String
end

collection :settings do
  entity     Setting
  repository SettingRepository

  attribute :default_cost_square_meter, Integer
end

module Admin::Controllers::Steads
  class Update
    include Admin::Action

    expose :stead

    params do
      param :id
      param :stead do
        param :cost_square_meter, presence: true
        param :serial_number, presence: true
        param :total_area, presence: true
        param :description, presence: true
      end
    end

    def call(params)
      stead = SteadRepository.find(params[:id])
      stead.update(params[:stead])
      SteadRepository.update(stead)
      redirect_to routes.steads_path
    end
  end
end

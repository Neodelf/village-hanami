module Admin::Controllers::Steads
  class Create
    include Admin::Action

    params do
      param :stead do
        param :cost_square_meter, presence: true
        param :serial_number, presence: true
        param :total_area, presence: true
        param :description, presence: true
      end
    end

    def call(params)
      @stead = SteadRepository.create(Stead.new(params[:stead]))
      redirect_to routes.steads_path
    end
  end
end

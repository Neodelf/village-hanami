module Admin::Controllers::Steads
  class Destroy
    include Admin::Action

    params do
      param :id, presence: true
    end

    def call(params)
      stead = SteadRepository.find(params[:id])
      SteadRepository.delete(stead)
      redirect_to routes.steads_path
    end
  end
end

module Admin::Controllers::Steads
  class Edit
    include Admin::Action

    expose :stead

    def call(params)
      @stead = SteadRepository.find(params[:id])
    end
  end
end

module Admin::Controllers::Steads
  class New
    include Admin::Action

    expose :stead

    def call(params)
      @stead = Stead.new
    end
  end
end

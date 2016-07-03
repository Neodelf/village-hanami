module Admin::Controllers::Steads
  class Index
    include Admin::Action

    expose :steads

    def call(params)
      @steads = SteadRepository.for_index_page
    end
  end
end

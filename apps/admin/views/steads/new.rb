module Admin::Views::Steads
  class New
    include Admin::View
    def form
      Form.new(:stead, routes.steads_path)
    end

    def submit_label
      'Создать'
    end
  end
end

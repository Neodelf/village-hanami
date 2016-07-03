module Admin::Views::Steads
  class Edit
    include Admin::View

    def form
      Form.new(:stead, routes.stead_path(id: stead.id),
        {stead: stead}, {method: :patch})
    end

    def submit_label
      'Обновить'
    end
  end
end

module Admin
  module Views
    class ApplicationLayout
      include Admin::Layout
      
      def active_class(current_path)
        'active' if request.path_info == current_path
      end
    end
  end
end

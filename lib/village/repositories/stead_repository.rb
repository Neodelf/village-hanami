class SteadRepository
  include Hanami::Repository

  def self.for_index_page
    query do
      order(:serial_number)
    end
  end
end

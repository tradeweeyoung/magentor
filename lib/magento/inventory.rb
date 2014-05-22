module MagentoAPI
  class Inventory < Base
    extend MagentoAPI::Helpers::Collection
    class << self
      def api_path
        "product_stock"
      end
    end
  end
end

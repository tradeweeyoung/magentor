module Magento
  class Inventory < Base
    extend Magento::Helpers::Collection
    class << self
      def api_path
        "product_stock"
      end
    end
  end
end

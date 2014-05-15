module Magento
  # http://www.magentocommerce.com/wiki/doc/webservices-api/api/cataloginventory_stock_item
  # 101  Product not exists.
  # 102  Product inventory not updated. Details in error message.
  class ProductStock < Base
    extend Magento::Helpers::Crud
    class << self
      undef :create, :info, :destroy, :find_by_id, :find
    end
  end
end

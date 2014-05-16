module Magento
  # http://www.magentocommerce.com/wiki/doc/webservices-api/api/catalog_product_type
  # list
  class ProductType < Base
    extend Magento::Helpers::Collection
  end
end

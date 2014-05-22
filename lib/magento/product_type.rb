module MagentoAPI
  # http://www.magentocommerce.com/wiki/doc/webservices-api/api/catalog_product_type
  # list
  class ProductType < Base
    extend MagentoAPI::Helpers::Collection
  end
end

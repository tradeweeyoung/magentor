module Magento ##TODO
  # http://www.magentocommerce.com/wiki/doc/webservices-api/api/catalog_product_attribute_set
  # list
  # attributeAdd
  # attributeRemove
  # create
  # groupAdd
  # groupRemove
  # groupRename
  # remove
  class ProductAttributeSet < Base
    extend Magento::Helpers::Collection
  end
end

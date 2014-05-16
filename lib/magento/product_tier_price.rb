module Magento
  # http://www.magentocommerce.com/wiki/doc/webservices-api/api/catalog_product_type
  # 100  Product not exists.
  # 101  Invalid data given. Details in error message.
  # 102  Tier prices not updated. Details in error message.
  # info
  # update
  class ProductTierPrice < Base
    extend Magento::Helpers::Crud
    class << self
      undef :create, :destroy, :all, :where
    end

    # def update_attribute(name, value)
    #   # TODO: find actual name of field for product id or sku
    #   @attributes[name] = value
    #   self.class.update(self.product, Hash[*[name.to_sym, value]])
    # end
    #
    # def update_attributes(attrs)
    #   # TODO: find actual name of field for product id or sku
    #   attrs.each_pair { |k, v| @attributes[k] = v }
    #   self.class.update(self.product, attrs)
    # end
  end
end

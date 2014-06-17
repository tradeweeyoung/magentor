module MagentoAPI ##TODO
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
    extend MagentoAPI::Helpers::Crud
    class << self
      undef :update, :find

      def create(attributes)
        commit("create", attributes[:name], attributes[:skeleton_id])
      end
    end

  end
end

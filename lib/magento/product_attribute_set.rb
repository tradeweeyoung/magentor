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

      def group_add(id, name)
        commit("groupAdd", id, name)
      end

      def attribute_add(attribute_id, id, group_id)
        commit("attributeAdd", attribute_id, id, group_id)
      end

      def attributes(id)
        MagentoAPI::Base.connection.call(
          "catalog_product.listOfAdditionalAttributes",
          "simple", id)
      end
    end

  end
end

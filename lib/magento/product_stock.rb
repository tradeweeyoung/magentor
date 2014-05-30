module MagentoAPI
  # http://www.magentocommerce.com/wiki/doc/webservices-api/api/cataloginventory_stock_item
  # 101  Product not exists.
  # 102  Product inventory not updated. Details in error message.
  # list
  # update
  class ProductStock < Base
    class << self
      def update(*args)
        commit("update", *args)
      end

      def find_many(ids) #or skus
        commit("list", ids)
      end
    end
  end
end

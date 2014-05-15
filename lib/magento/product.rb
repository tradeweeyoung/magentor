module Magento
  # http://www.magentocommerce.com/wiki/doc/webservices-api/api/catalog_product
  # 100  Requested store view not found.
  # 101  Product not exists.
  # 102  Invalid data given. Details in error message.
  # 103  Product not deleted. Details in error message.
  class Product < Base
    extend Magento::Helpers::Crud
    class << self
      # Return: int
      #
      # Arguments:
      #
      # string type - product type
      # int set - product attribute set ID
      # string sku - product SKU
      # array productData - array of attributes values
      def create(*args)
        id = commit("create", *args)
        find(id)
      end

      # catalog_product.currentStore
      # Set/Get current store view
      #
      # Return: int
      #
      # Arguments:
      #
      # mixed storeView - store view ID or code (optional)
      def current_store(*args)
        commit("currentStore", *args)
      end

      # catalog_product.setSpecialPrice
      # Update product special price
      #
      # Return: boolean
      #
      # Arguments:
      #
      # mixed product - product ID or Sku
      # float specialPrice - special price (optional)
      # string fromDate - from date (optional)
      # string toDate - to date (optional)
      # mixed storeView - store view ID or code (optional)
      def set_special_price(*args)
        commit('setSpecialPrice', *args)
      end

      # catalog_product.getSpecialPrice
      # Get product special price data
      #
      # Return: array
      #
      # Arguments:
      #
      # mixed product - product ID or Sku
      # mixed storeView - store view ID or code (optional)
      def get_special_price(*args)
        commit('getSpecialPrice', *args)
      end
    end
  end
end

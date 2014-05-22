module MagentoAPI
  # http://www.magentocommerce.com/wiki/doc/webservices-api/api/catalog_product_attribute_media
  # 100  Requested store view not found.
  # 101  Product not exists.
  # 102  Invalid data given. Details in error message.
  # 103  Requested image not exists in product images’ gallery.
  # 104  Image creation failed. Details in error message.
  # 105  Image not updated. Details in error message.
  # 106  Image not removed. Details in error message.
  # 107  Requested product doesn’t support images
  # currentStore
  # list
  # info
  # types
  # create
  # update
  # remove
  class ProductMedia < Base
    extend MagentoAPI::Helpers::Crud
    class << self
      # catalog_product_attribute_media.remove
      # Remove product image
      #
      # Return: boolean
      #
      # Arguments:
      #
      # mixed product - product ID or Sku
      # string file - image file name
      def destroy(*args)
        commit("remove", *args)
      end

      # catalog_product_attribute_media.currentStore
      # Set/Get current store view
      #
      # Return: int
      #
      # Arguments:
      #
      # mixed storeView - store view code or ID (optional)
      def current_store(*args)
        commit("currentStore", *args)
      end

      # catalog_product_attribute_media.types
      # Retrieve product image types (image, small_image, thumbnail, etc...)
      #
      # Return: array
      #
      # Arguments:
      #
      # int setId - product attribute set ID
      def types(*args)
        commit("types", *args)
      end
    end
  end
end

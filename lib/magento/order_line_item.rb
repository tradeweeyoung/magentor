module MagentoAPI
  class OrderLineItem < Base
    class << self
      def find_by_order_id_and_id(order_id, id)
        MagentoAPI::Order.find(order_id).order_line_items.select{ |i| i.id == id }.first
      end
    end

    def id
      self.item_id
    end

    def order
      MagentoAPI::Order.find_by_id(self.order_id)
    end

    def product
      MagentoAPI::Product.find_by_id_or_sku(self.product_id)
    end
  end
end

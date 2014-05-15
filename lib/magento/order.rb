module Magento
  class Order < Base
    extend Magento::Helpers::Crud
    # http://www.magentocommerce.com/wiki/doc/webservices-api/api/sales_order
    # 100  Requested order not exists.
    # 101  Invalid filters given. Details in error message.
    # 102  Invalid data given. Details in error message.
    # 103  Order status not changed. Details in error message.

    class << self
      undef :create, :update, :destroy, :find_by_id, :find

      # sales_order.addComment
      # Add comment to order
      #
      # Return: boolean
      #
      # Arguments:
      #
      # string orderIncrementId - order increment id
      # string status - order status
      # string comment - order comment (optional)
      # boolean notify - notification flag (optional)
      def add_comment(*args)
        commit('addComment', *args)
      end

      # sales_order.hold
      # Hold order
      #
      # Return: boolean
      #
      # Arguments:
      #
      # string orderIncrementId - order increment id
      def hold(*args)
        commit('hold', *args)
      end

      # sales_order.unhold
      # Unhold order
      #
      # Return: boolean
      #
      # Arguments:
      #
      # mixed orderIncrementId - order increment id
      def unhold(*args)
        commit('unhold', *args)
      end

      # sales_order.cancel
      # Cancel order
      #
      # Return: boolean
      #
      # Arguments:
      #
      # mixed orderIncrementId - order increment id
      def cancel(*args)
        commit('cancel', *args)
      end

      def find(id)
        where({:order_id => id}).first
      end

      def where(options = {})
        filters = {}
        options.each_pair { |k, v| filters[k] = {:eq => v} }
        results = where(filters)
        if results.any?
          results.collect do |o|
            find(o.increment_id)
          end
        else
          []
        end
      end
    end

    def order_items
      self.items.collect do |item|
        Magento::OrderItem.new(item)
      end
    end

    def shipping_address
      Magento::CustomerAddress.new(@attributes["shipping_address"])
    end

    def billing_address
      Magento::CustomerAddress.new(@attributes["billing_address"])
    end
  end
end

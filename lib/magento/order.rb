module MagentoAPI
  # http://www.magentocommerce.com/wiki/doc/webservices-api/api/sales_order
  # 100  Requested order not exists.
  # 101  Invalid filters given. Details in error message.
  # 102  Invalid data given. Details in error message.
  # 103  Order status not changed. Details in error message.
  # list
  # info
  # addComment
  # hold
  # unhold
  # cancel
  class Order < Base
    extend MagentoAPI::Helpers::Crud

    class << self
      undef :create, :update, :destroy
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

      def newer_than(date)
        commit('list', created_at: { from: parse_date(date) })
      end

      private
      def parse_date(date)
        if date.is_a?(String)
          Time.parse(date)
        else
          date
        end.strftime("%Y-%m-%d %H:%M:%S")
      end
    end

    def order_line_items
      self.items.collect do |item|
        MagentoAPI::OrderItem.new(item.symbolize_keys!)
      end
    end

    def shipping_address
      MagentoAPI::CustomerAddress.new(@attributes[:shipping_address])
    end

    def billing_address
      MagentoAPI::CustomerAddress.new(@attributes[:billing_address])
    end

    def status_history
      @attributes[:status_history].map(&:symbolize_keys!)
    end

    def payment
      OpenStruct.new @attributes[:payment]
    end
  end
end

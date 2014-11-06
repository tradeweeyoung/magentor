module MagentoAPI
  # http://www.magentocommerce.com/wiki/doc/webservices-api/api/sales_order_invoice
  # 100  Requested shipment does not exists.
  # 101  Invalid filters given. Details in error message.
  # 102  Invalid data given. Details in error message.
  # 103  Requested order does not exists
  # 104  Invoice status not changed.
  # list
  # info
  # create
  # addComment
  # capture
  # cancel
  class Invoice < Base
    extend MagentoAPI::Helpers::Crud
    class << self
      undef :update, :destroy

      def create(*args)
        commit("create", *args)
      end

      # sales_order_invoice.addComment
      # Add new comment to shipment
      #
      # Arguments:
      #
      # string invoiceIncrementId - invoice increment id
      # string comment - invoice comment
      # boolean email - send invoice on e-mail (optional)
      # boolean includeComment - include comments in e-mail (optional)
      def add_comment(*args)
        commit('addComment', *args)
      end

      # sales_order_invoice.capture
      # Capture invoice
      #
      # Return: boolean
      #
      # Arguments:
      #
      # string invoiceIncrementId - invoice increment id
      #
      # Notes:
      #
      # You should check the invoice to see if can be captured before attempting to capture an invoice,
      # otherwise the API call with generate an error.
      #
      # Invoices have states as defined in the model Mage_Sales_Model_Order_Invoice:
      #
      # STATE_OPEN = 1
      # STATE_PAID = 2
      # STATE_CANCELED = 3
      # Also note there is a method call in the model that checks this for you canCapture(), and it also
      # verifies that the payment is able to be captured, so the invoice state might not be the only
      # condition that’s required to allow it to be captured.
      def capture(*args)
        commit('capture', *args)
      end

      # sales_order_invoice.void
      # Void invoice
      #
      # Return: boolean
      #
      # Arguments:
      #
      # string invoiceIncrementId - invoice increment id
      def void(*args)
        commit('void', *args)
      end

      # sales_order_invoice.cancel
      # Cancel invoice
      #
      # Return: boolean
      #
      # Arguments:
      #
      # string invoiceIncrementId - invoice increment id
      def cancel(*args)
        commit('cancel', *args)
      end

      def api_path
        "order_invoice"
      end
    end

    def invoice_line_items
      self.items.collect do |item|
        MagentoAPI::InvoiceLineItem.new(item.symbolize_keys!)
      end
    end
  end
end

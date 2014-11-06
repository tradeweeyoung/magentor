module MagentoAPI
  class InvoiceLineItem < Base
    class << self
      def find_by_invoice_id_and_id(invoice_id, id)
        MagentoAPI::Invoice.find(invoice_id).order_line_items.select{ |i| i.id == id }.first
      end
    end

    def id
      self.item_id
    end

    def invoice
      MagentoAPI::Invoice.find_by_id(self.invoice_id)
    end

    def product
      MagentoAPI::Product.find_by_id_or_sku(self.product_id)
    end
  end
end

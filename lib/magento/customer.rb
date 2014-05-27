module MagentoAPI
  # http://www.magentocommerce.com/wiki/doc/webservices-api/api/customer
  # 100  Invalid customer data. Details in error message.
  # 101  Invalid filters specified. Details in error message.
  # 102  Customer does not exist.
  # 103  Customer not deleted. Details in error message.
  # list
  # create
  # info
  # update
  # delete
  class Customer < Base
    extend MagentoAPI::Helpers::Crud

    def addresses
      @addresses ||= MagentoAPI::CustomerAddress.where(customer_id: self.id)
    end

    def update_attribute(name, value)
      @attributes[name] = value
      self.class.update(self.id, Hash[*[name.to_sym, value]])
    end

    def update_attributes(attrs)
      attrs.each_pair { |k, v| @attributes[k] = v }
      self.class.update(self.id, attrs)
    end
  end
end

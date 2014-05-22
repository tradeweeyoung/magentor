module MagentoAPI
  # http://www.magentocommerce.com/wiki/doc/webservices-api/api/customer_group
  # list
  class CustomerGroup < Base
    extend MagentoAPI::Helpers::Collection
  end
end

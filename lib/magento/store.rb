module MagentoAPI
  class Store < Base
    def self.current
      MagentoAPI::Base.connection.call('core_magento.info')
    end
  end
end

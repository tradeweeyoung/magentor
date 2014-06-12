module MagentoAPI
  class Store < Base
    def self.info
      MagentoAPI::Base.connection.call('core_magento.info')
    end

    def self.current
      MagentoAPI::Base.connection.call('store.list')
    end

  end
end

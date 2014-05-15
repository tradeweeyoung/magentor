module Magento
  # http://www.magentocommerce.com/wiki/doc/webservices-api/api/directory_country
  class Country < Base
    extend Magento::Helpers::Collection
    class << self
      def find(id)
        list.select{ |c| c.id == id }.first
      end

      def find_by_iso(iso)
        list.select{ |c| [c.iso2_code, c.iso3_code].include? iso }.first
      end
    end

    def regions
      Magento::Region.find_by_country(self.iso2_code)
    end
  end
end

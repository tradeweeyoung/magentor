module Magento
  # http://www.magentocommerce.com/wiki/doc/webservices-api/api/directory_region
  class Region < Base
    extend Magento::Helpers::Collection
    class << self
      def find_by_country(iso)
        list(iso)
      end

      def find_by_country_and_id(iso, id)
        list(iso).select{ |r| r.id == id }.first
      end

      def find_by_country_iso_and_iso(country_iso, iso)
        list(country_iso).select{ |r| r.code == iso }.first
      end
    end
  end
end

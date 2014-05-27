module MagentoAPI
  # http://www.magentocommerce.com/wiki/doc/webservices-api/api/directory_region
  # list
  class Region < Base
    extend MagentoAPI::Helpers::Collection
    class << self
      def find_by_country(iso)
        where(iso: iso)
      end

      def find_by_country_and_id(iso, id)
        where(iso: iso).select{ |r| r.id == id }.first
      end

      def find_by_country_iso_and_iso(country_iso, iso)
        where(iso: country_iso).select{ |r| r.code == iso }.first
      end
    end
  end
end

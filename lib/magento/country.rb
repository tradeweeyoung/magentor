module MagentoAPI
  # http://www.magentocommerce.com/wiki/doc/webservices-api/api/directory_country
  # list
  class Country < Base
    extend MagentoAPI::Helpers::Collection
    class << self
      def find(id)
        all.select{ |c| c['country_id'] == id }.first
      end

      def find_by_iso(iso)
        all.select{ |c| [c['iso2_code'], c['iso3_code']].include? iso }.first
      end

    end

    def regions
      MagentoAPI::Region.find_by_country(self.iso2_code)
    end
  end
end

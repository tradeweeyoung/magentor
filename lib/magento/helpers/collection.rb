module Magento
  module Helpers
    module Collection
      # record.all
      # Retrieve records
      #
      # Return: array
      def all
        where
      end

      def where(options = {})
        filters = {}
        options.each_pair { |k, v| filters[k] = {:eq => v} }
        commit("list", filters)
      end
    end
  end
end

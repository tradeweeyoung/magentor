module MagentoAPI
  module Helpers
    module Crud
      include MagentoAPI::Helpers::Collection
      # record.create
      # Create record
      #
      # Return: int
      #
      # Arguments:
      def create(attributes)
        id = commit("create", attributes)
        record = new(attributes)
        record.id = id
        record
      end

      # record.find
      # Retrieve record data
      #
      # Return: array
      #
      # Arguments:
      #
      # int recordId - record ID.
      def find(id)
        new(commit("info", id))
      end

      # record.update
      # Update record data
      #
      # Return: boolean
      #
      # Arguments:
      #
      # int recordId - record ID
      def update(*args)
        commit("update", *args)
      end

      # record.delete
      # Delete record
      #
      # Return: boolean
      #
      # Arguments:
      #
      # int recordId - record ID.
      def destroy(*args)
        commit("delete", *args)
      end
    end
  end
end

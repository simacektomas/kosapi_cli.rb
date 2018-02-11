module KOSapiCLI
  # This class is proxy for KOSapiClient.
  # It construts the request for KOSapi
  class KOSapiClientProxy
    def initialize
      @client = KOSapiClient
      @resource = nil
      @response_formater = nil
    end

    def setup_resource(resource)
      @resource = @client.send(resource)
    end

    def query_kosapi(id = nil,
                     subresource = nil,
                     limit = nil,
                     offset = nil,
                     query = {})
      raise 'Setup resource befor calling query' unless @resource
      setup_id(id)
      setup_subresource(subresource)
      setup_limit(limit)
      setup_offset(offset)
      setup_query(query)
      finalize
    end

    private

    def setup_id(id)
      @resource.find(id)
    end

    def setup_subresource(subresource)
      @resource.send(subresource) if subresource
    end

    def setup_offset(offset)
      @resource.offset(offset) if offset
    end

    def setup_limit(limit)
      @resource.limit(limit) if limit
    end

    def setup_query(query)
      @resource.query(query) if query && !query.empty?
    end

    def finalize
      @resource.finalize
    end
  end
end

module KOSapiCLI
  # This class is proxy for KOSapiClient.
  # It construts the request for KOSapi
  class KOSapiClientProxy
    def self.parameters
      %i[id subresource offset limit query]
    end

    def initialize
      @client = KOSapiClient
      @response = KOSapiCLI::KOSapiResponse.new
    end

    def setup_resource(resource)
      @resource = @client.send(resource)
    end

    def send_request(options = {})
      raise 'Setup resource before calling query' unless @resource
      self.class.parameters.each do |prop|
        send("setup_#{prop}", options[prop])
      end
      @response.process_response(finalize)
    end

    private

    def setup_id(id)
      @id = true
      @resource.find(id)
    end

    def setup_subresource(subresource)
      raise 'Setup id before calling subresource' unless @id
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

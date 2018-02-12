module KOSapiCLI
  # Represents KOSapi response. It can convert the response
  # to various formats
  class KOSapiResponse
    def initialize
      @entities = []
    end

    def process_response(response)
      if response.is_a? KOSapiClient::Entity::ResultPage

        response.auto_paginate = false
        response.each do |entity|
          @entities << entity.to_hash
        end
      else
        @entities << response.to_hash
      end
      self
    end

    def to_xml
      @entities.each do |entity|
      end
    end

    def to_csv; end

    def to_table; end

    def to_yaml; end

    def to_json
      return JSON.pretty_generate(@entities.first) if @entities.count == 1
      JSON.pretty_generate(@entities)
    end
  end
end

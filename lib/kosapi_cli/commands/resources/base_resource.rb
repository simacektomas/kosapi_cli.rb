module KOSapiCLI
  module Commands
    module Resources
      # This class is base for all KOSapi resources.
      # It provides fetch method that is common for
      # all resources in KOSapi.
      class BaseResource < Thor
        class_option :limit,
                     aliases: ['-l'],
                     type: :numeric,
                     desc: 'Limit the number of entities in KOSapi response'

        class_option :ofset,
                     aliases: ['-o'],
                     type: :numeric,
                     desc: 'Change the ofset of the first entity in response'

        def self.subresources
          []
        end

        def self.define_subresources
          subresources.each do |subresource|
            desc public_send("#{subresource}_usage"),
                 public_send("#{subresource}_desc")

            long_desc public_send("#{subresource}_long_desc")

            define_method(subresource) do |id|
              response = KOSapiCLI.query_kosapi(self.class.subcommand_name,
                                                id,
                                                subresource.to_s,
                                                options[:limit],
                                                options[:ofset],
                                                nil)
            end
          end
        end

        def self.subcommand_name
          name.split('::').last.downcase || 'default'
        end

        def self.usage
          base = name.split('::').last.downcase
          "#{base} [find|#{subresources.join('|')}]"
        end

        def self.description
          'Default description of BaseResource, CHANGE IT!'
        end

        # Each resource class need to have at least
        # fetch method that will fetch resource
        # from KOSapi
        desc('find [ID]',
             'prints exams if no ID specified, otherwise prints specified exam')

        long_desc <<-LONGDESC
          The find command is common for all resources in KOSapiCLI.
          It will print out message with desired KOSapi entity or entities.
          There is one optional parameter ID. Ommiting this parameter will
          cause printing multiple entities at once. If you specify ID the
          entity with this id will be printed out.

          `kosapi_cli resource <resource> find <id>` will print out
          message with specified resource that has filled id.

          TODO exmaple
        LONGDESC

        def find(id = nil)
          if KOSapiCLI.initialize_token
            response = KOSapiCLI.query_kosapi(self.class.subcommand_name,
                                              id,
                                              nil,
                                              options[:limit],
                                              options[:ofset],
                                              nil)
          end
        end
      end
    end
  end
end

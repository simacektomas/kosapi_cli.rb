module KOSapiCLI
  module Commands
    module Resources
      # This class is base for all KOSapi resources.
      # It provides fetch method that is common for
      # all resources in KOSapi.
      class BaseResource < Thor
        extend KOSapiCLI::Commands::Output

        class_option :limit,
                     aliases: ['-l'],
                     type: :numeric,
                     desc: 'Limit the number of entities in KOSapi response'

        class_option :offset,
                     aliases: ['-o'],
                     type: :numeric,
                     desc: 'Change the offset of the first entity in response'

        class_option :format,
                     aliases: ['-f'],
                     type: :string,
                     default: 'json',
                     enum: ['json'],
                     desc: 'Specify the output format of KOSapi response'

        class_option :query,
                     aliases: ['-r'],
                     type: :string,
                     desc: 'RSQL expresion that provide more detailed query'

        class_option :xpartial,
                     aliases: ['-x'],
                     type: :string,
                     desc: 'XPartial expresion that provide response filtering'

        def self.subresources
          []
        end

        def self.define_subresources
          subresources.each do |subresource|
            desc public_send("#{subresource}_usage"),
                 public_send("#{subresource}_desc")

            long_desc public_send("#{subresource}_long_desc")

            define_method(subresource) do |id|
              options[:id] = id
              options[:subresource] = subresource.to_s
              process_cmd
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
          options[:id] = id
          process_cmd
        end

        private

        def process_cmd
          if KOSapiCLI.initialize_token
            begin
              KOSapiCLI.setup_resource self.class.subcommand_name
              response = KOSapiCLI.send_request(options)
              puts response.send("to_#{options[:format]}")
            rescue RuntimeError
              self.class.error_bad_credentials(options[:verbose])
              exit(1)
            rescue OAuth2::Error => e
              self.class.error_kosapi_exception(KOSapiCLI.parse_kosapi_exception(e),
                                                options[:verbose])
              exit(2)
            end
          else
            self.class.error_no_login(options[:verbose])
            exit(3)
          end
        end
      end
    end
  end
end

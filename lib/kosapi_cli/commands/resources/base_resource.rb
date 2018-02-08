module KOSapiCLI
  module Commands
    module Resources
      # This class is base for all KOSapi resources.
      # It provides fetch method that is common for
      # all resources in KOSapi.
      class BaseResource < Thor
        def self.subcommand_name
          name.split('::').last.downcase || 'default'
        end

        def self.usage
          base = name.split('::').last.downcase
          "#{base} [SUBCOMMANDS]"
        end

        def self.description
          'Default description of BaseResource, CHANGE IT!'
        end

        # Each resource class need to have at least
        # fetch method that will fetch resource
        # from KOSapi
        desc('fetch [ID]',
             'prints exams if no ID specified, otherwise prints specified exam')

        long_desc <<-LONGDESC
          The fetch command is common for all resources in KOSapiCLI.
          It will print out message with desired KOSapi entity or entities.
          There is one optional parameter ID. Ommiting this parameter will
          cause printing multiple entities at once. If you specify ID the
          entity with this id will be printed out.

          `kosapi_cli resource <resource> fetch <id>` will print out
          message with specified resource that has filled id.

          TODO exmaple
        LONGDESC

        def fetch(id = nil)
          raise NotImplementedError
        end
      end
    end
  end
end

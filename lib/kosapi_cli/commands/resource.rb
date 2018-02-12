module KOSapiCLI
  module Commands
    # This class will load all subcommands
    # for KOSapi resources
    class Resource < BaseCommand
      def self.excluded_resources
        [:BaseResource]
      end

      def self.usage
        'resource [RESOURCE]'
      end

      def self.description
        'Specify resource of KOSapi that will be queried.'
      end

      KOSapiCLI::Commands::Resources.constants.each do |c|
        subcommand = KOSapiCLI::Commands::Resources.const_get(c)
        next if (!subcommand.is_a? Class) || (excluded_resources.include? c)
        register(subcommand,
                 subcommand.subcommand_name,
                 subcommand.usage,
                 subcommand.description)
      end
    end
  end
end

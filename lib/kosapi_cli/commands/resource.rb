module KOSapiCLI
  module Commands
    # This class will load all subcommands
    # for KOSapi resources
    class Resource < Thor
      class_option :rsql,
                   aliases: '-r',
                   desc: 'Specify RSQL command to more complex query.',
                   type: :string

      def self.exclude_commands
        [:BaseResource]
      end

      def self.subcommand_name
        'resource'
      end

      def self.usage
        'resource [RESOURCE]'
      end

      def self.description
        'desc'
      end

      KOSapiCLI::Commands::Resources.constants.each do |c|
        subcommand = KOSapiCLI::Commands::Resources.const_get(c)
        next if (!subcommand.is_a? Class) || (exclude_commands.include? c)
        register(subcommand,
                 subcommand.subcommand_name,
                 subcommand.usage,
                 subcommand.description)
      end
    end
  end
end

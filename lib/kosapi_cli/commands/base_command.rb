module KOSapiCLI
  module Commands
    # Base class for KOSapiCLI commands,
    # It provide class methods for
    # name usage and default description
    class BaseCommand < Thor
      def self.command_name
        name.split('::').last.downcase
      end

      def self.subcommands
        sub = []
        public_instance_methods(false).each do |m|
          sub << m.to_s
        end
        sub
      end

      def self.usage
        "#{command_name} [#{subcommands.join('|')}]"
      end

      def self.description
        "Default desription of #{command_name} command. CHANGE IT!"
      end
    end
  end
end

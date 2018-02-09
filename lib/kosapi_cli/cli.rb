module KOSapiCLI
  # The main Thor class that will
  # manage all commandline arguments
  class CLI < Thor
    class_option :verbose,
                 aliases: ['-v'],
                 desc: 'Makes command to print more detailed informations',
                 type: :boolean,
                 default: false

    def self.excluded_commands
      [:BaseCommand]
    end
    # Automatic load of all subcommands
    # in Commands module
    KOSapiCLI::Commands.constants.each do |c|
      command = KOSapiCLI::Commands.const_get(c)
      next if (!command.is_a? Class) || (excluded_commands.include? c)
      desc command.usage, command.description
      register(command,
               command.command_name,
               command.usage,
               command.description)
    end
  end
end

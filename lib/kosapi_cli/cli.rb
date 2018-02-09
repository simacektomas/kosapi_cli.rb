module KOSapiCLI
  # The main Thor class that will
  # manage all commandline arguments
  class CLI < Thor
    def self.excluded_commands
      [:BaseCommand]
    end
    # Automatic load of all subcommands
    # in Commands module
    KOSapiCLI::Commands.constants.each do |c|
      command = KOSapiCLI::Commands.const_get(c)
      next if (!command.is_a? Class) || (excluded_commands.include? c)
      register(command,
               command.command_name,
               command.usage,
               command.description)
    end
  end
end

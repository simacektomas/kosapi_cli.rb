module KOSapiCLI
  # The main Thor class that will
  # manage all commandline arguments
  class CLI < Thor
    # Automatic load of all subcommands
    # in Commands module
    KOSapiCLI::Commands.constants.each do |c|
      command = KOSapiCLI::Commands.const_get(c)
      next unless command.is_a? Class
      register(command,
               command.subcommand_name,
               command.usage,
               command.description)
    end
  end
end

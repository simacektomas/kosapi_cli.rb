module KOSapiCLI
  # The main Thor class that will
  # manage all commandline arguments
  class CLI < Thor
    class_option :verbose,
                 aliases: '-v',
                 desc: 'This option enable logging detail information.',
                 type: :boolean

    class_option :rsql,
                 aliases: '-r',
                 desc: 'Specify RSQL command to more complex query.',
                 type: :string

    class_option :xpartial,
                 aliases: '-x',
                 desc: 'Specify XPartial expresion filtering query output.',
                 type: :string
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

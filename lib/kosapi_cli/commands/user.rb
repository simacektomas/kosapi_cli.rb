module KOSapiCLI
  module Commands
    # Class that handles user authentication
    class User < BaseCommand
      def self.description
        '`user` command handles user login and logout'
      end

      method_option  :username,
                     aliases: ['-u'],
                     desc: 'Represents KOSapi client id',
                     type: :string

      method_option  :password,
                     aliases: ['-p'],
                     desc: 'Represents KOSapi client secret',
                     type: :string

      desc 'login', 'Create .env file in user\'s home if it doesn\'t exist.'

      long_desc <<-LONGDESC
        `login` command creates .kosapi_cli.env file in user's home
        directory if it doesn't already exist. If it doesn't or
        the stored token is not valid user is asked for credentials.
        Afterwards the new valid token is stored into the file.

        You can specify credentials by two options on commandline.
        Options are -p|--password and -u|--username. If both options
        are set, no user input is required.

        `$kosapi_cli user login`
      LONGDESC

      def login
        KOSapiCLI.login(options[:username], options[:password]) unless KOSapiCLI.initialize_token
      end

      desc 'logout', 'Remove created .env file if it exists.'

      long_desc <<-LONGDESC
        `logout` command search for created .kosapi_cli.env in user's
        home and delete it.

        `$kosapi_cli user logout`
      LONGDESC

      def logout
        KOSapiCLI.logout
      end
    end
  end
end

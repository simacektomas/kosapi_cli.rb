module KOSapiCLI
  module Commands
    # Provides messages for user in diferent sceranios,
    # only prints out the message if verbose mode specified.
    module Output
      def valid_token(verbose)
        STDERR.puts 'INFO: Client token founded.' if verbose
      end

      def invalid_token(verbose)
        STDERR.puts 'INFO: File with client token not found or the token is invalid.' if verbose
      end

      def error_bad_credentials(verbose = true)
        STDERR.puts 'ERROR: Bad credentials was provided.' if verbose
      end

      def error_invalid_token(verbose = true)
        STDERR.puts 'ERROR: Loaded token is invalid. Run logout and then login again.'
        STDERR.puts 'INFO: Run `kosapi user logout` and `kosapi user login` to get new token.'
      end

      def error_no_login(verbose = true)
        STDERR.puts 'ERROR: Cannot find token in home dir or it is invalid.'
        STDERR.puts 'INFO: Run `kosapi_cli user login` to obtain new token.'
      end

      def error_kosapi_exception(parameters, verbose = true)
        STDERR.puts 'ERROR: KOSapi exception.'
        parameters.each do |key, value|
          STDERR.puts "#{key.upcase}: #{value}" if verbose
        end
      end
    end
  end
end

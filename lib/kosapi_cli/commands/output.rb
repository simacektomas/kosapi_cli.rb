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
    end
  end
end

module KOSapiCLI
  # Handles loading user credentials
  # from input and output stream
  class KOSapiCredentialsLoader
    attr_accessor :id, :secret

    def initialize(input = $stdin, output = $stdout)
      @input = input
      @output = output
    end

    def ask_client_id
      @output.puts 'Client ID (KOSAPI_OAUTH_CLIENT_ID):'
      @id = @input.gets.chomp
    end

    def ask_client_secret
      @output.puts 'Client secret (KOSAPI_OAUTH_CLIENT_SECRET):'
      @secret = @input.gets.chomp
    end

    def credentials
      return { client_id: @id, client_secret: @secret } if @if && @secret
      nil
    end
  end
end

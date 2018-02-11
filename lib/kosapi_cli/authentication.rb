module KOSapiCLI
  # Module for KOSapiCLI authentication
  module Authentication
    def logout
      begin
        File.delete(config.env_file)
      rescue Errno::ENOENT
        return false
      end
      true
    end

    def initialize_token
      loaded = loader.restore_token
      if loaded
        configure_client(loaded, nil, nil)
        loader.store_token(token)
        true
      else
        false
      end
    end

    def login(id = nil, secret = nil)
      id ||= creds.ask_client_id
      secret ||= creds.ask_client_secret
      configure_client(nil, id, secret)
      loader.store_token(token)
    end
  end
end

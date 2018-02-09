module KOSapiCLI
  # Module for KOSapiCLI authentication
  module Authentication
    def login(id = nil, secret = nil)
      t = loader.restore_token

      if t
        configure_client(t, nil, nil)
      else
        id ||= creds.ask_client_id
        secret ||= creds.ask_client_secret
        configure_client(nil, id, secret)
      end

      loader.store_token(token)
    end

    def logout
      begin
        File.delete(config.env_file)
      rescue Errno::ENOENT
        return false
      end
      true
    end
  end
end

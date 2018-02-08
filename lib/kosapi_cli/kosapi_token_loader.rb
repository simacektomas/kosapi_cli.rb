module KOSapiCLI
  # Loads and store kosapi_token to env_file
  class KOSapiTokenLoader
    def initialize(config = KOSapiCLI::Configuration.new)
      @config = config
    end

    # Try to restore tokne from YAML config file
    def restore_token
      yaml = load_config
      # Check if config file is well formated
      return nil if yaml.empty? || !yaml['config']
      return nil unless token_valid?(yaml['config'])
      # Return loaded token
      yaml['config']['client_token']
    end

    # Try to store token to YAML config file
    def store_token(token)
      yaml = load_config
      # Construct new token in configuration
      config = { 'client_token' => token }
      yaml['config'] = config
      # Write configuration back to env_file
      File.open(@config[:env_file], 'w') do |f|
        YAML.dump(yaml, f)
      end
    end

    private

    # Loads YAML config file sored on :env_file path
    def load_config
      begin
        File.open(@config[:env_file], 'r') do |f|
          return YAML.safe_load(f)
        end
      rescue Errno::ENOENT
        {}
      end
      {}
    end

    # Takes config and validates if token is valid
    def token_valid?(config)
      token = config['client_token']
      if token && token['access_token'] && token['expires_at']
        return false if token['expires_at'] < Time.now.to_i
        return true
      end
      false
    end
  end
end

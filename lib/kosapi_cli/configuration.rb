module KOSapiCLI
  # Stores path to env_file
  Configuration = Struct.new(:env_file) do
    DEFAULT_OPTIONS = {
      env_file: File.join(ENV['HOME'], '/.kosapi_cli.env')
    }.freeze

    def initialize(options = {})
      DEFAULT_OPTIONS.merge(options).each do |option, value|
        self[option] = value
      end
    end
  end
end

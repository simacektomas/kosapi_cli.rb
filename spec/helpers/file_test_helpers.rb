require 'yaml'

module FileTestHelpers
  def write_yaml_env(filename, content)
    File.open(filename, 'w') do |f|
      YAML.dump(content, f)
    end
  end
end

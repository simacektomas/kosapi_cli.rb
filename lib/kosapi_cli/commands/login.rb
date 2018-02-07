require 'thor/group'

module KOSapiCLI
  module Commands
    #
    class Login < Thor::Group
      class_option :username,
                   aliases: ['-u'],
                   desc: '',
                   type: :string

      class_option :password,
                   aliases: ['-p'],
                   desc: '',
                   type: :string

      def self.subcommand_name
        'login'
      end

      def self.usage
        'login'
      end

      def self.description
        'desc'
      end

      def restore_token
      end

      def credentials
      end

      def store_token
      end
    end
  end
end

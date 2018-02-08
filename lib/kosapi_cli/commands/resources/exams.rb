module KOSapiCLI
  module Commands
    module Resources
      class Exams < Thor
        def self.subcommand_name
          'exams'
        end

        def self.usage
          'exams [SUBCOMMAD]'
        end

        def self.description
          'Represent KOSapi exams resource. It can be query for data.'
        end

      end
    end
  end
end

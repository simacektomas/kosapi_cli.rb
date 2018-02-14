module KOSapiCLI
  module Commands
    module Resources
      # Represents Parallels KOSapi resource
      class Parallels < BaseResource
        def self.description
          'represents KOSapi Parallels resource that can be querried'
        end

        def self.subresources
          %i[related students]
        end

        def self.related_desc
          'returns related parallels to specified one'
        end

        def self.related_usage
          'related ID'
        end

        def self.related_long_desc
          <<-LONGDESC
            The related command will print parallels that are related
            with some parallel. The parallel is specified by compulsory
            ID.
          LONGDESC
        end

        def self.students_desc
          'returns students registred in parallel'
        end

        def self.students_usage
          'students ID'
        end

        def self.students_long_desc
          <<-LONGDESC
            The students command will print students that are regirstred
            on a parallel. The paralel is specified by compuslory ID.
          LONGDESC
        end

        define_subresources
      end
    end
  end
end

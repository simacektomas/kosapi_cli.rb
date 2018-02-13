module KOSapiCLI
  module Commands
    module Resources
      # Represents KOSapi branches resource
      class Branches < BaseResource
        def self.description
          'represents KOSapi Branches resources that can be querried'
        end

        def self.subresources
          [:study_plans]
        end

        def self.study_plans_desc
          'prints plans associated with branch defined by ID'
        end

        def self.study_plans_usage
          'study_plans ID'
        end

        def self.study_plans_long_desc
          <<-LONGDESC
            The study_plans command will print out study plans associated with
            some branch. The branch is specified with compulsory parameter ID.
          LONGDESC
        end

        define_subresources
      end
    end
  end
end

module KOSapiCLI
  module Commands
    module Resources
      # Represents KOSapi divisions resource
      class Divisions < BaseResource
        def self.description
          'represents KOSapi Divisions reource that can be queried'
        end

        def self.subresources
          %i[courses subdivisions teachers]
        end

        def self.courses_desc
          'returns all courses that are secured by the division'
        end

        def self.courses_usage
          'courses ID'
        end

        def self.courses_long_desc
          <<-LONGDESC
            The courses subcommand will shows courses that are
            secured by a division. The division is specified by
            ID parameter that is CODE of the division.
          LONGDESC
        end

        def self.subdivisions_desc
          'returns all division subordinate to the given one'
        end

        def self.subdivisions_usage
          'subdivisions ID'
        end

        def self.subdivisions_long_desc
          <<-LONGDESC
            The subdivisions command will return all division that
            are subordinate to a division. The division is specified
            by ID that is CODE of the division.
          LONGDESC
        end

        def self.teachers_desc
          'returns all teachers that come under the division or its subdivision'
        end

        def self.teachers_usage
          'teachers ID'
        end

        def self.teachers_long_desc
          <<-LONGDESC
            The teachers command will return all teachers that come under
            a division or its subdivisions recursively. The division is
            specified by ID that is CODE if the division.
          LONGDESC
        end

        define_subresources
      end
    end
  end
end

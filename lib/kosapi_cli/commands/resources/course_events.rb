module KOSapiCLI
  module Commands
    module Resources
      #Represents KOSapi course_events resource
      class CourseEvents < BaseResource
        def self.description
          'represents KOSapi CourseEvents resources that can be queried'
        end

        def self.subresources
          [:attendees]
        end

        def self.attendees_desc
          'prints students registred for the event specified by ID'
        end

        def self.attendees_usage
          'attendees ID'
        end

        def self.attendees_long_desc
          <<-LONGDESC
            The attendees command will print out message with students registred
            for an event. The course is specified with compulsory ID.
          LONGDESC
        end

        define_subresources
      end
    end
  end
end

module KOSapiCLI
  module Commands
    module Resources
      # Represents KOSapi exams resource
      class Exams < BaseResource
        def self.description
          'represents KOSapi Exams resources that can be queried'
        end

        def self.subresources
          [:attendees]
        end

        def self.attendees_desc
          'prints students registred for the exam specified by ID'
        end

        def self.attendees_usage
          'attendees ID'
        end

        def self.attendees_long_desc
          <<-LONGDESC
            The attendees command will print out message with students registred
            for an exam. The exam is specified with compulsory parametr ID.

            `kosapi_cli resource exams attendees 18633` will print out students
            registred for exam with id 18633 if such an exam exists.

            TODO example output.
          LONGDESC
        end

        define_subresources
      end
    end
  end
end

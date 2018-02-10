module KOSapiCLI
  module Commands
    module Resources
      # Represents KOSapi exams resource
      class Exams < BaseResource
        def self.subresources
          ['attendees']
        end

        def self.attendees_desc
          desc 'attendees ID',
               'prints students registred for the exam specified by ID'
        end

        def self.attendees_long_desc
          long_desc <<-LONGDESC
            The attendees command will print out message with students registred
            for an exam. The exam is specified with compulsory parametr ID.

            `kosapi_cli resource exams attendees 18633` will print out students
            registred for exam with id 18633 if such an exam exists.

            TODO example output.
          LONGDESC
        end
      end
    end
  end
end

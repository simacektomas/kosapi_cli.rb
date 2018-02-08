module KOSapiCLI
  module Commands
    module Resources
      class Exams < BaseResource
        desc 'attendees ID', 'prints students registred for the exam specified by ID'

        long_desc <<-LONGDESC
          The attendees command will print out message with students registred
          for an exam. The exam is specified with compulsory parametr ID.

          `kosapi_cli resource exams attendees 18633` will print out students
          registred for exam with id 18633 if such an exam exists.

          TODO example output.
        LONGDESC

        def attendees(id)
          #raise NotImplementedError
        end
      end
    end
  end
end

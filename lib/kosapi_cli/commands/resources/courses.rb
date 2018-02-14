module KOSapiCLI
  module Commands
    module Resources
      # Represents KOSapi courses resource
      class Courses < BaseResource
        class_option :detail,
                     aliases: ['-d'],
                     type: :numeric,
                     desc: 'specify the detail of infromation'

        class_option :sem,
                     aliases: ['-s'],
                     type: :array,
                     desc: 'list of semesters that should be searched'

        def self.description
          'represents KOSapi Courses resources that can be queried'
        end

        def self.subresources
          # None of these subresources are implemented in KOSapiClient
          #[:events, :exams, :parallels, :students,
          # :instances, :branches ]
          []
        end

        def self.events_desc
          'returns events associated with specified course'
        end

        def self.events_usage
          'events ID'
        end

        def self.events_long_desc
          <<-LONGDESC
            The events command will show events associated with
            a course. The course is specified with compuslory ID.
          LONGDESC
        end

        def self.exams_desc
          'returns exam terms for specified course'
        end

        def self.exams_usage
          'exams ID'
        end

        def self.exams_long_desc
          <<-LONGDESC
            The exams command will show exam terms listed for
            a course. The course is specified with compuslory ID.
            Exam terms are from current semester.
          LONGDESC
        end

        def self.parallels_desc
          'returns course parallels for current semestr'
        end

        def self.parallels_usage
          'parallels ID'
        end

        def self.parallels_long_desc
          <<-LONGDESC
            The parallels command will show course parallels for 
            specified course from current semester.
          LONGDESC
        end

        def self.students_desc
          'return students registred for the course in current semester'
        end

        def self.students_usage
          'students ID'
        end

        def self.students_long_desc
          <<-LONGDESC
            The students command will print out students registred for
            a course. The course is specified by ID and the output is
            associated with current semester.
          LONGDESC
        end

        def self.instances_desc
          'returns all instances of given course'
        end

        def self.instances_usage
          'instances ID'
        end

        def self.instances_long_desc
          <<-LONGDESC
            The instances command will return all instances of a course.
            The course is specified by ID. It returns olny attributes of
            instance not generic attributes of course.
          LONGDESC
        end

        def self.branches_desc
          'returns all branches in which the course is subdued'
        end

        def self.branches_usage
          'branches ID'
        end

        def self.branches_long_desc
          <<-LONGDESC
            The branches command will prints all branches in which 
            a course is subdued. The course is specified by compulsory
            ID.
          LONGDESC
        end

        define_subresources
      end
    end
  end
end

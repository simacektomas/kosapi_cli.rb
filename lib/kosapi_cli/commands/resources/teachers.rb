module KOSapiCLI
  module Commands
    module Resources
      # represents KOSapi Teachers resource
      class Teachers < BaseResource
        class_option :sem,
                     aliases: ['-s'],
                     type: :array,
                     desc: 'list of semesters that should be searched'

        def self.description
          'represents KOSapi Teachers resource that can be querried'
        end

        def self.subresources
          %i[courses parallels exams timetable]
        end

        def self.courses_desc
          'returns courses that the teacher takes part in'
        end

        def self.courses_usage
          'courses ID|USERNAME'
        end

        def self.courses_long_desc
          <<-LONGDESC
            The courses command will return courses that teacher
            learns, lead exercise or guarantees. The teacher is
            specified by his ID or USERNAME. You can specify
            semesters.
          LONGDESC
        end

        def self.parallels_desc
          'returns parallels which the user learns'
        end

        def self.parallels_usage
          'parallels ID|USERNAME'
        end

        def self.parallels_long_desc
          <<-LONGDESC
            The parallels command will return parallels that a
            teacher lectures or leads excercise. The teacher is
            specified by his ID or USERNAME. You can specify
            semesetrs.
          LONGDESC
        end

        def self.exams_desc
          'returns exams that the teacher created'
        end

        def self.exams_usage
          'exams ID|USERNAME'
        end

        def self.exams_long_desc
          <<-LONGDESC
            The exams command will return exams that a teacher
            created in specified semesters. The teacher is
            specified by his ID or USERNAME.
          LONGDESC
        end

        def self.timetable_desc
          'returns the teachers constraints'
        end

        def self.timetable_usage
          'timetable ID|USERNAME'
        end

        def self.timetable_long_desc
          <<-LONGDESC
            The timetable command will retrun a teachers constraints
            for specified semesters. The teachers is specified by his
            ID or USERNAME.
          LONGDESC
        end

        define_subresources
      end
    end
  end
end

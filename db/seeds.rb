# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
students = [{"name" => "Tom", "birthdate" => DateTime.parse("12/12/1991")},
            {"name" => "Kevin", "birthdate" => DateTime.parse("12/12/1991")},
            {"name" => "Jack", "birthdate" => DateTime.parse("12/12/1991")},
            {"name" => "Sabrina", "birthdate" => DateTime.parse("12/12/1991")},
            {"name" => "Roberts", "birthdate" => DateTime.parse("12/12/1991")},
            {"name" => "George", "birthdate" => DateTime.parse("12/12/1991")},
            {"name" => "Angelina", "birthdate" => DateTime.parse("12/12/1991")},
            {"name" => "Katie", "birthdate" => DateTime.parse("12/12/1991")},
            {"name" => "Bob", "birthdate" => DateTime.parse("12/12/1991")},
            {"name" => "Mike", "birthdate" => DateTime.parse("12/12/1991")}]

events = [{"name" => "Thanksgiving", "time" => "1201", "location" => "a"},
          {"name" => "Independence Day", "time" => "1202", "location" => "b"},
          {"name" => "Christmas", "time" => "1203", "location" => "c"},
          {"name" => "MLK", "time" => "1204", "location" => "d"},
          {"name" => "Fall event", "time" => "1205", "location" => "e"},
          {"name" => "Spring event", "time" => "1206", "location" => "f"},
          {"name" => "Church Anniversary event", "time" => "1207", "location" => "g"},
          {"name" => "New Year event", "time" => "1208", "location" => "h"},
          {"name" => "Haloween", "time" => "1209", "location" => "i"},
          {"name" => "Example event", "time" => "1210", "location" => "j"},
          {"name" => "Birthday event", "time" => "1211", "location" => "k"}]
          
students_events = [{"student_id" => "1", "event_id" => "1", "checkin_time" => "11", "checkout_time" => "22"},
                   {"student_id" => "1", "event_id" => "2", "checkin_time" => "12", "checkout_time" => "23"},
                   {"student_id" => "1", "event_id" => "3", "checkin_time" => "13", "checkout_time" => "24"},
                   {"student_id" => "2", "event_id" => "2", "checkin_time" => "14", "checkout_time" => "25"},
                   {"student_id" => "2", "event_id" => "4", "checkin_time" => "15", "checkout_time" => "26"},
                   {"student_id" => "2", "event_id" => "6", "checkin_time" => "16", "checkout_time" => "27"},
                   {"student_id" => "3", "event_id" => "7", "checkin_time" => "17", "checkout_time" => "28"},
                   {"student_id" => "4", "event_id" => "9", "checkin_time" => "18", "checkout_time" => "29"},
                   {"student_id" => "5", "event_id" => "4", "checkin_time" => "19", "checkout_time" => "30"},
                   {"student_id" => "6", "event_id" => "10", "checkin_time" => "20", "checkout_time" => "31"},
                   {"student_id" => "7", "event_id" => "4", "checkin_time" => "21", "checkout_time" => "32"}]
                
students.each do |list|
  Student.create!(list)
end

events.each do |list|
  Event.create!(list)
end

students_events.each do |list|
  StudentsEvent.create!(list)
end


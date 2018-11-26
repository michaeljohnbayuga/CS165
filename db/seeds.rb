# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# show = Show.create(name: 'Sample Show', code: 'SAMPLE')
# season = Season.create(season_no: 1, show_id: show.id)
# episode = Episode.create(episode_no: 1, showep_no: 1, title: "Sample Title", air_date: Date.today, season_id: season.id)
User.destroy_all
Dormer.destroy_all
Dailyreport.destroy_all
Guard.destroy_all
Violation.destroy_all
User.create(username:"Akuma",name:"Michael",password:"password",is_admin:"True")
User.create(username:"Maria",name:"Elize",password:"password",is_admin:"True")
User.create(username:"Michael",name:"Michael",password:"password")
Dormer.create(student_number:"2013-05008",name:"Michael",room_number:"131",sex:"M", course_year:"BS Comsci 6th year", status: "in")
Dormer.create(student_number:"2000-00000",name:"Elize",room_number:"131",sex:"F", course_year:"BS Comsci 6th year",status: "in")
Guard.create(name:"GuardName1", schedule:"M-F 0700H-1900H")
#Studentassistant.create(student_number: "2013-05008", name:"Michael")
#Bedcheck.create(student_number: "2000-00001",sa_name: "Michael", guard_name:"GuardName1")
Violation.create(student_number: "2013-05008", admin_name: "Michael")
Violation.create(student_number: "2000-00000", admin_name: "Michael")

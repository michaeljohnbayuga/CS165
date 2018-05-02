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
User.create(username:"Akuma",name:"Michael",password:"password",is_admin:"True")
User.create(username:"Maria",name:"Elize",password:"password")
Show.create(name:"Goblin",network:"7",start_year:"2011",end_year:"2017")
Show.create(name:"One Liter of Tears",network:"7",start_year:"2011",end_year:"2017")
Show.create(name:"A Korean Oddysey",network:"7",start_year:"2011",end_year:"2017")
Show.create(name:"Baker King",network:"7",start_year:"2011",end_year:"2017")
Show.create(name:"Full House",network:"7",start_year:"2011",end_year:"2017")
Show.create(name:"Lol",network:"7",start_year:"2011",end_year:"2017")

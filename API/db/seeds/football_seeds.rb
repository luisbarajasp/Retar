require 'sportradar/nfl.rb'

#
# Sport: Football
#
Sport.create(name: "football", categories: [
    Category.new(name: "United States", country_code: "us", leagues:[
        nfl = League.new(name: "National Football League", code: "nfl")
    ])
])

hierarchy = SportRadar::NFL.new.league_hierarchy()
hierarchy.conferences.each do |c|
    conference = Conference.new(name: "#{c.name}", code: "#{c.alias.downcase}", league: nfl)
    c.divisions.each do |d|
        division = Division.new(name: "#{d.name}", code: "#{d.alias.downcase}", conference: conference)
        d.teams.each do |t|
            # Teams and Venues (because they do not embed in division only belong)
            team = Team.create(
                _id: "#{t.id}", 
                name: "#{t.name}", 
                market: "#{t.market}", 
                code: "#{t.alias}",
                division: division
            )
            # if(team.code != "NYG")
                Venue.create(
                    _id: "#{t.venue.id}",
                    name: "#{t.venue.name}",
                    city: "#{t.venue.city}",
                    state: "#{t.venue.state}",
                    country: "#{t.venue.country}",
                    zip: "#{t.venue.zip}",
                    address: "#{t.venue.address}",
                    capacity: t.venue.capacity,
                    surface: "#{t.venue.surface}",
                    roof_type: "#{t.venue.roof_type}",
                    team: team
                )
            # end
        end
    end
end
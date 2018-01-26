require 'sportradar/trial/nfl.rb'

#
# Sport: Football
#
s = Sport.create(name: "football")
c = Category.new(name: "United States", country_code: "us", sport: s)
nfl = League.new(name: "National Football League", alias: "nfl", category: c)

hierarchy = SportRadar::Trial::NFL.new.league_hierarchy()
hierarchy.conferences.each do |c|
    conference = Conference.new(name: "#{c.name}", alias: "#{c.alias.downcase}", league: nfl)
    c.divisions.each do |d|
        division = Division.new(name: "#{d.name}", alias: "#{d.alias.downcase}", conference: conference)
        d.teams.each do |t|
            # Teams and Venues (because they do not embed in division only belong)
            team = Team.create(
                id: "#{t.id}", 
                name: "#{t.name}", 
                market: "#{t.market}", 
                alias: "#{t.alias}",
                division: division
            )
                Venue.create(
                    id: "#{t.venue.id}",
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
        end
    end
end
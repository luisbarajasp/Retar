require 'sportradar/trial/nfl.rb'

#
# Sport: Football
# League: NFL
#

module Consumers
    class NFL
        def initialize()
            @sport = Sport.find("football")
            @category = @sport.categories.find("us")
            @league = @category.leagues.find("nfl")
        end
        def new_season(year, nfl_season)
            season = SportRadar::Trial::NFL.new.season_schedule(year, nfl_season)
            s = @league.seasons.create(_id: "#{season.id}", name: "#{season.name}", type: "#{season.type}", year: "#{season.year}")
            season.weeks.each do |w|
                week = Week.create(_id: "#{w.id}", title: "#{w.title}", sequence: w.sequence, season: s)
                w.games.each do |g|
                    game = Game.create(_id: "#{g.id}", status: "#{g.status}", number: g.number, scheduled: g.scheduled.to_time, attendance: g.attendance, weather: "#{g.weather}", venue_id: "#{g.venue.id}", home_id: "#{g.home.id}", away_id: "#{g.away.id}", week: week)
                    # TODO: Score se supone que aun no tiene porque todavia no empiezan los juegos
                    if(g.respond_to?(:scoring))
                        score = Score.create(home_points: g.scoring.home_points, away_points: g.scoring.away_points, game: game)
                        g.scoring.periods.each do |p|
                            Period.create(_id: "#{p.id}", type: "#{p.period_type}", home_points: p.home_points, away_points: p.away_points, number: p.number, score: score)
                        end
                    end
                end
            end
        end
        def new_season_print(year, nfl_season)
            season = SportRadar::Trial::NFL.new.season_schedule(year, nfl_season)
            # season.weeks.each do |w|
            #     w.games.each do |g|
            #         puts g.scoring
            #     end
            # end
            season.weeks.first.games.each do |g|
                puts g
            end
        end
    end
end
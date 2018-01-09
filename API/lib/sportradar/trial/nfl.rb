require 'json'
require 'ostruct'
require 'open-uri'

module SportRadar
    module Trial
        class NFL
            def league_hierarchy()
                source = "http://api.sportradar.us/nfl-ot2/league/hierarchy.json?api_key=56gscnvwpvbhvkfgq6vumjdm"
                data = JSON.load(open(source))
                json_string = data.to_json
                json_object = JSON.parse(json_string, object_class: OpenStruct)
                return json_object
            end
            def season_schedule(year, nfl_season)
                source = "http://api.sportradar.us/nfl-ot2/games/#{year}/#{nfl_season}/schedule.json?api_key=56gscnvwpvbhvkfgq6vumjdm"
                data = JSON.load(open(source))
                json_string = data.to_json
                json_object = JSON.parse(json_string, object_class: OpenStruct)
                return json_object
            end
        end
    end
end
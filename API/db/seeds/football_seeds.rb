#
# Sport: Football
#
Sport.create(name: "football", categories: [
    Category.new(name: "United States", country_code: "us", leagues:[
        League.new(name: "National Football League", code: "nfl", conferences: [
            Conference.new(name: "AFC", code: "afc", divisions: [
                east = Division.new(name: "AFC East", code: "afc_east")
            ])
        ])
    ])
])

# Teams and Venues (because they do not embed in division only belong)
# Buffalo
bills = Team.create(
    _id: "768c92aa-75ff-4a43-bcc0-f2798c2e1724", 
    name: "Bills", 
    market: "Buffalo", 
    code: "BUF",
    division: east
)
Venue.create(
    _id: "e9e0828e-37fc-4238-a317-49037577dd55",
    name: "New Era Field",
    city: "Orchard Park",
    state: "NY",
    country: "USA",
    zip: "14127",
    address: "One Bills Drive",
    capacity: 73079,
    surface: "artificial",
    roof_type: "outdoor",
    team: bills
)
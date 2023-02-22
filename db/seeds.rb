location = Location.create(
    city: "Denver", 
    state: "CO"
)

venue = Venue.create(
    name: "Empower Field",
    description: "The home of the Denver Broncos, this football stadium can host up to 60,000 concert-goers.",
    image_url: "https://static.clubs.nfl.com/image/private/t_editorial_landscape_12_desktop/broncos/lzeqgvkilxkzmdrakual",
    location_id: location.id
)
location = [
    {city: "Denver", 
    state: "CO",
    id: 1
}]

location.each do |t|
    Location.create(t)
end

venue = [
{name: "Fillmore Auditorium",
description: "Since opening in 1907, the Fillmore Auditorium has risen to be one of the most prominent forces in the Denver, Colorado music scene. It holds the title of the largest indoor venue for general admission seating in Colorado.",
image_url: "https://assets.livenationcdn.com/uploads/fil_den_1024x576.jpg",
capacity: "3900",
location_id: 1
}]


venue.each do |t|
    Venue.create(t)
end




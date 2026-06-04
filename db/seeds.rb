ProjectImage.destroy_all
Project.destroy_all

# Chair / furniture image pools to rotate through per project
chair_images = [
  "https://images.unsplash.com/photo-1567538096630-e0c55bd6374c?w=1400&q=85",
  "https://images.unsplash.com/photo-1555041469-a586c61ea9bc?w=1400&q=85",
  "https://images.unsplash.com/photo-1592078615290-033ee584e267?w=1400&q=85",
  "https://images.unsplash.com/photo-1586023492125-27b2c045efd7?w=1400&q=85",
  "https://images.unsplash.com/photo-1631679706909-1844bbd07221?w=1400&q=85",
  "https://images.unsplash.com/photo-1580480055273-228ff5388ef8?w=1400&q=85",
  "https://images.unsplash.com/photo-1506439773649-6e0eb8cfb237?w=1400&q=85",
  "https://images.unsplash.com/photo-1519947486511-46149fa0a254?w=1400&q=85",
  "https://images.unsplash.com/photo-1549187774-b4e9b0445b41?w=1400&q=85",
  "https://images.unsplash.com/photo-1561677843-39dee7a319ca?w=1400&q=85",
  "https://images.unsplash.com/photo-1571898223751-37df3929b8c5?w=1400&q=85",
  "https://images.unsplash.com/photo-1538688525198-9b88f6f53126?w=1400&q=85",
  "https://images.unsplash.com/photo-1567538096630-e0c55bd6374c?w=1400&q=85",
  "https://images.unsplash.com/photo-1598300042247-d088f8ab3a91?w=1400&q=85",
  "https://images.unsplash.com/photo-1604578762246-41134e37f9cc?w=1400&q=85",
  "https://images.unsplash.com/photo-1577140917170-285929fb55b7?w=1400&q=85",
]

12.times do |i|
  project = Project.create!(
    title:     "Design Project #{i + 1}",
    architect: "Old Four Legs",
    image_url: chair_images[i % chair_images.length],
    category:  "architecture",
    featured:  i == 0,
    position:  i + 1
  )

  # 4–5 images per project, cycling through the pool offset by project index
  4.times do |j|
    project.project_images.create!(
      image_url: chair_images[(i + j) % chair_images.length],
      position:  j + 1
    )
  end
end

travel_projects = [
  { title: "Kyoto Temples",       category: "japan",        image_url: "https://images.unsplash.com/photo-1528360983277-13d401cdc186?w=900&q=80", position: 1 },
  { title: "Tokyo Streets",       category: "japan",        image_url: "https://images.unsplash.com/photo-1540959733332-eab4deabeeaf?w=900&q=80", position: 2 },
  { title: "Oslo Fjord",          category: "scandinavia",  image_url: "https://images.unsplash.com/photo-1531366936337-7c912a4589a7?w=900&q=80", position: 1 },
  { title: "Copenhagen Canals",   category: "scandinavia",  image_url: "https://images.unsplash.com/photo-1513622470522-26c3c8a854bc?w=900&q=80", position: 2 },
  { title: "Seine at Dusk",       category: "paris",        image_url: "https://images.unsplash.com/photo-1499856871958-5b9627545d1a?w=900&q=80", position: 1 },
  { title: "Marais Architecture", category: "paris",        image_url: "https://images.unsplash.com/photo-1502602898657-3e91760cbb34?w=900&q=80", position: 2 },
  { title: "Amalfi Coast",        category: "italy",        image_url: "https://images.unsplash.com/photo-1555881400-74d7acaacd8b?w=900&q=80", position: 1 },
  { title: "Tuscan Landscape",    category: "italy",        image_url: "https://images.unsplash.com/photo-1467269204594-9661b134dd2b?w=900&q=80", position: 2 },
  { title: "Milford Sound",       category: "new-zealand",  image_url: "https://images.unsplash.com/photo-1507699622108-4be3abd695ad?w=900&q=80", position: 1 },
  { title: "Queenstown Dusk",     category: "new-zealand",  image_url: "https://images.unsplash.com/photo-1469854523086-cc02fe5d8800?w=900&q=80", position: 2 },
]

travel_projects.each { |attrs| Project.create!(attrs.merge(featured: false)) }

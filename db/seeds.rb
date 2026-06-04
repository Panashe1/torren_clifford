Project.destroy_all

architecture_projects = [
  { title: "Design Project 1",  architect: "Old Four Legs", image_url: "https://images.unsplash.com/photo-1600596542815-ffad4c1539a9?w=900&q=80", featured: true,  position: 1 },
  { title: "Design Project 2",  architect: "Old Four Legs", image_url: "https://images.unsplash.com/photo-1600585154340-be6161a56a0c?w=900&q=80", featured: false, position: 2 },
  { title: "Design Project 3",  architect: "Old Four Legs", image_url: "https://images.unsplash.com/photo-1512917774080-9991f1c4c750?w=900&q=80", featured: false, position: 3 },
  { title: "Design Project 4",  architect: "Old Four Legs", image_url: "https://images.unsplash.com/photo-1493809842364-78817add7ffb?w=900&q=80", featured: false, position: 4 },
  { title: "Design Project 5",  architect: "Old Four Legs", image_url: "https://images.unsplash.com/photo-1523217582562-09d0def993a6?w=900&q=80", featured: false, position: 5 },
  { title: "Design Project 6",  architect: "Old Four Legs", image_url: "https://images.unsplash.com/photo-1501183638710-841dd1904471?w=900&q=80", featured: false, position: 6 },
  { title: "Design Project 7",  architect: "Old Four Legs", image_url: "https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?w=900&q=80", featured: false, position: 7 },
  { title: "Design Project 8",  architect: "Old Four Legs", image_url: "https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=900&q=80", featured: false, position: 8 },
  { title: "Design Project 9",  architect: "Old Four Legs", image_url: "https://images.unsplash.com/photo-1554995207-c18c203602cb?w=900&q=80", featured: false, position: 9 },
  { title: "Design Project 10", architect: "Old Four Legs", image_url: "https://images.unsplash.com/photo-1497366216548-37526070297c?w=900&q=80", featured: false, position: 10 },
  { title: "Design Project 11", architect: "Old Four Legs", image_url: "https://images.unsplash.com/photo-1470770841072-f978cf4d019e?w=900&q=80", featured: false, position: 11 },
  { title: "Design Project 12", architect: "Old Four Legs", image_url: "https://images.unsplash.com/photo-1556912167-f556f1f39fdf?w=900&q=80", featured: false, position: 12 },
]

architecture_projects.each do |attrs|
  Project.create!(attrs.merge(category: "architecture"))
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

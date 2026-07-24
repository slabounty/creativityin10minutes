# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# db/seeds.rb

puts "Seeding media..."

media = {}

[
  {
    name: "Pencil",
    description: "Great for sketching, shading, and experimenting.",
    active: true
  },
  {
    name: "Pen",
    description: "Commit to your marks and embrace happy accidents.",
    active: true
  },
  {
    name: "Colored Pencil",
    description: "Add color while keeping the control of drawing.",
    active: true
  },
  {
    name: "Watercolor",
    description: "Focus on shapes, values, and loose color.",
    active: true
  },
  {
    name: "Marker",
    description: "Bold shapes and confident lines.",
    active: true
  }
].each do |attributes|
  medium = Medium.find_or_initialize_by(name: attributes[:name])
  medium.assign_attributes(attributes)
  medium.save!
  media[medium.name] = medium
end

puts "Seeding prompts..."

prompts = {}

[
  {
    title: "Draw Your Favorite Mug",
    instructions: <<~TEXT,
      Draw your favorite mug using only straight lines.
      Ignore the small details and focus on the overall shape.
    TEXT
    category: "Observation",
    active: true
  },
  {
    title: "Continuous Line",
    instructions: <<~TEXT,
      Draw your shoe without lifting your drawing tool from the paper.
      Don't worry about perfection—just keep the line moving.
    TEXT
    category: "Constraint",
    active: true
  },
  {
    title: "Bird's-Eye View",
    instructions: <<~TEXT,
      Choose an everyday object and draw it as if you were looking
      straight down from above.
    TEXT
    category: "Perspective",
    active: true
  },
  {
    title: "Texture Study",
    instructions: <<~TEXT,
      Draw two objects side by side—one rough and one smooth.
      Use marks and shading to communicate texture.
    TEXT
    category: "Texture",
    active: true
  },
  {
    title: "Tiny Creature",
    instructions: <<~TEXT,
      Invent a creature small enough to live comfortably inside
      a teacup.
    TEXT
    category: "Imagination",
    active: true
  }
].each do |attributes|
  prompt = Prompt.find_or_initialize_by(title: attributes[:title])
  prompt.assign_attributes(attributes)
  prompt.save!
  prompts[prompt.title] = prompt
end

puts "Creating today's prompt..."

DailyPrompt.find_or_create_by!(prompt_date: Date.current) do |daily|
  daily.prompt = prompts["Draw Your Favorite Mug"]
  daily.medium = media["Pencil"]
end

puts "Done!"

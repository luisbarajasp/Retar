# Seeds for intializing DB with basic information

# Since the data is in multiple files, load all of them
Dir[File.join(Rails.root, 'db', 'seeds', '*.rb')].sort.each do |seed|
    load seed
end
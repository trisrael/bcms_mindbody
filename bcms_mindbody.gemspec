SPEC = Gem::Specification.new do |spec| 
  spec.name = "bcms_mindbody"
  spec.rubyforge_project = spec.name
  spec.version = "1.0.0"
  spec.summary = "A Mindbody API module for BrowserCMS with some extra widgets"
  spec.author = "Tristan Goffman"
  spec.email = "tgoffman@gmail.com"  
  spec.files += Dir["app/controllers/**/*"]
  spec.files += Dir["app/models/*"]
  spec.files += Dir["app/helpers/**/*"]
  spec.files += Dir["app/views/cms/**/*"]
  spec.files += Dir["app/portlets/**/*"]
  spec.files += Dir["db/migrate/*.rb"]
  spec.files -= Dir["db/migrate/*_browsercms_*.rb"]
  spec.files -= Dir["db/migrate/*_load_seed_data.rb"]
  spec.files += Dir["rails/init.rb"]
  spec.has_rdoc = true
  spec.extra_rdoc_files = ["README"]
end

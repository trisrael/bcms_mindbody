SPEC = Gem::Specification.new do |spec| 
  spec.name = %q{bcms_mindbody}
  spec.rubyforge_project = %{browsercms}  
  spec.version = "1.0.0"
  spec.summary = "A Mindbody API module for BrowserCMS with some extra widgets"
  spec.author = "Tristan Goffman"
  spec.require_paths = ["lib"]
  spec.has_rdoc= true
  spec.extra_rdoc_files = ["README"]
  spec.files  = Dir['Rakefile', '{bin,lib,app,  man,test,spec}/**/*','{public/bcms/**/**/**}', 'README*', 'LICENSE*'] & `git ls-files -z`.split("\0")
end



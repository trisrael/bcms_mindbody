SPEC = Gem::Specification.new do |spec| 
  spec.name = %q{bcms_mindbody}
  spec.rubyforge_project = %{browsercms}  
  spec.version = "1.0.0"
  spec.summary = "A Mindbody API module for BrowserCMS with some extra widgets"
  spec.author = "Tristan Goffman"
  spec.files = [
	"app/models/staff.rb", 
	"app/models/mindbody_options.rb", 
	"app/controllers/staff_controller.rb",
	"app/views/portlets/staff/_form.html.erb",
	"app/views/portlets/staff/render.html.erb",
	"app/portlets/staff_portlet.rb",
	"lib/bcms_mindbody/routes.rb",
	"lib/bcms_mindbody/engine.rb",
	"lib/bcms_mindbody.rb",
	"db/migrate/20110529021707_mindbody_options.rb",
    "lib/generators/bcms_mindbody/install/USAGE",
    "lib/generators/bcms_mindbody/install/install_generator.rb",
	"public/bcms/bcms_mindbody/javascripts/backbone.js",
	"public/bcms/bcms_mindbody/javascripts/backbone-min.js",
	"public/bcms/bcms_mindbody/javascripts/underscore.js",
	"public/bcms/bcms_mindbody/javascripts/underscore-min.js"]
  spec.require_paths = ["lib"]
  spec.has_rdoc= true
  spec.extra_rdoc_files = ["README"]
end

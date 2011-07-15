SPEC = Gem::Specification.new do |spec| 
  spec.name = %q{bcms_mindbody}
  spec.rubyforge_project = %{browsercms}
  
  spec.version = "1.0.0"
  spec.summary = "A Mindbody API module for BrowserCMS with some extra widgets"
  spec.author = "Tristan Goffman"
  spec.files = [
	"app/models/staff.rb", 
	"app/controllers/staff_controller.rb",
	"app/views/portlets/staff/_form.html.erb",
	"app/views/portlets/staff/render.html.erb",
	"app/portlets/staff_portlet.rb",
	"lib/bcms_mindbody/routes.rb",
	"lib/bcms_mindbody/engine.rb",
	"lib/bcms_mindbody.rb"
]
  spec.require_paths = ["lib"]
  spec.has_rdoc= true
  spec.extra_rdoc_files = ["README"]
end

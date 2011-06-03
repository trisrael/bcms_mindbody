require 'cms/module_installation'

class BcmsMindbody::InstallGenerator < Cms::ModuleInstallation
  add_migrations_directory_to_source_root __FILE__
  
  copy_migration_file '20110529021707_create_mindbody_options.rb'
  copy_migration_file '20110602161007_add_join_options_to_portlet.rb'  
end


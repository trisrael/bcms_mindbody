require 'cms/module_installation'

class BcmsMindbody::InstallGenerator < Cms::ModuleInstallation
  add_migrations_directory_to_source_root __FILE__
  
  copy_migration_file '20110529021707_create_parameter_partials.rb'
  copy_migration_file '20110602161007_add_join_options_to_portlet.rb'  
  copy_migration_file '20110615064736_add_subclasses_of_parameter_partials.rb'
end


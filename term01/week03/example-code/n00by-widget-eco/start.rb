# Look for assets in the current directory.
$LOAD_PATH << '.'
# Require controller file.
require 'controller'

# Get singleton controller.
controller = Controller.instance
controller.init_system
# Global variables live outside of class definitions.
$important_global_variable = "N00BY RUBY"
puts($important_global_variable)



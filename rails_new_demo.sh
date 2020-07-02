mkdir work
cd work
rails new demo
# Installation error
# ...
Fetching sqlite3 1.4.2
Installing sqlite3 1.4.2 with native extensions
Gem::Ext::BuildError: ERROR: Failed to build gem native extension.

# Delete directory
C:\Ruby26-x64\lib\ruby\gems\2.6.0\cache
# Modify file
C:\Ruby26-x64\lib\ruby\gems\2.6.0\specifications

sqlite3-1.4.2.gemspec

  # s.require_paths = ["lib".freeze]
  s.require_paths = ["lib/sqlite3_native".freeze]

# This file manages Puppet module dependencies.
#
# It works a lot like Bundler. We provide some core modules by
# default. This ensures at least the ability to construct a basic
# environment.

def github(name, version, options = nil)
  options ||= {}
  options[:repo] ||= "boxen/puppet-#{name}"
  mod name, version, :github_tarball => options[:repo]
end

# Includes many of our custom types and providers, as well as global
# config. Required.

github "boxen", "2.1.0"

# Core modules for a basic development environment. You can replace
# some/most of these if you want, but it's not recommended.


github "gcc",      "1.0.0"
github "repository",      "2.0.2"
github "git",        "1.0.0"
github "homebrew", "1.1.2"
github "hub",      "1.0.0"
github "inifile",  "0.9.0", :repo => "cprice-puppet/puppetlabs-inifile"
github "stdlib",   "4.0.2", :repo => "puppetlabs/puppetlabs-stdlib"
github "sudo",     "1.0.0"
github "ruby",     "4.1.0"

github "osx",   "1.2.0"
github "nodejs",   "2.2.0"
github "postgresql",   "1.0.0"
github "mysql",   "1.0.0"
github "sysctl",   "1.0.0"
github "nvm",      "1.0.0"

github "wget",     "1.0.0"
github "autoconf",     "1.0.0"
github "libtool",     "1.0.0"
github "pkgconfig",     "1.0.0"
github "pcre",     "1.0.0"
github "chrome", "1.1.0"
github "firefox", "1.0.5"
github "iterm2", "1.0.2"
github "sublime_text_2", "1.2.0", :repo => "jpvanhal/puppet-sublime_text_2"
github "vmware_fusion", "1.0.0"
github "alfred2", "0.0.1", :repo => "grahamgilbert/puppet-alfred2"
github "sourcetree", "0.0.2", :repo => "jlgeering/puppet-sourcetree"
github "googledrive", "1.0.1", :repo => "gblair/puppet-googledrive"
github "mysql_workbench", "1.0.0", :repo => "cdburgess/puppet-mysql_workbench"
github "apache", "0.0.2", :repo =>"stoeffel/puppet-apache"
github "php", "0.5.0", :repo =>"mattheath/puppet-php"
github "vlc", "1.0.0"
github "transmission", "1.0.0"
github "caffeine", "1.0.0"
github "textexpander", "1.0.0"
github "java", "1.0.6"
github "vim", "1.0.3"
github "macvim", "1.0.0"
github "adium", "1.0.1"
github "eclipse", "1.0.0", :repo => "pulse00/puppet-eclipse"

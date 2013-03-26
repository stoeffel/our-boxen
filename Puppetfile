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

github "boxen", "1.2.0"

# Core modules for a basic development environment. You can replace
# some/most of these if you want, but it's not recommended.


github "gcc",      "1.0.0"
github "git",      "1.0.0"
github "homebrew", "1.1.2"
github "hub",      "1.0.0"
github "inifile",  "0.9.0", :repo => "cprice-puppet/puppetlabs-inifile"

github "nodejs",   "1.0.0"
github "postgresql",   "1.0.0"
github "sysctl",   "1.0.0"
github "nvm",      "1.0.0"
github "ruby",     "3.1.0"
github "stdlib",   "3.0.0", :repo => "puppetlabs/puppetlabs-stdlib"
github "sudo",     "1.0.0"
github "wget",     "1.0.0"
github "autoconf",     "1.0.0"
github "libtool",     "1.0.0"
github "pkgconfig",     "1.0.0"
github "pcre",     "1.0.0"


# Optional/custom modules. There are tons available at
# https://github.com/boxen.

github "chrome", "1.1.0"
github "iterm2", "1.0.2"
github "sublime_text_2", "1.1.0"
github "vmware_fusion", "1.0.0"
github "alfred2", "0.0.1", :repo => "grahamgilbert/puppet-alfred2"
github "sourcetree", "0.0.2", :repo => "jlgeering/puppet-sourcetree"
github "googledrive", "1.0.1", :repo => "gblair/puppet-googledrive"




github "apache", "0.0.1", :repo =>"mattheath/puppet-apache"


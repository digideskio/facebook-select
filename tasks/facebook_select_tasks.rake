VERSION = '1.0.3'

namespace :facebook_select do
  desc 'Install the facebook-select scripts into the public directory of this application'
  task :install => ['facebook_select:add_or_replace_facebook_select']

  desc 'Update the facebook-select scripts installed at public/javascripts and public/stylesheets for this application'
  task :update => ['facebook_select:add_or_replace_facebook_select']

  task :add_or_replace_facebook_select do
    require 'fileutils'
    
    src   = File.join(File.dirname(__FILE__), '..', 'public')
    dest  = "#{RAILS_ROOT}/public/javascripts/facebooklist.js"
    dest2 = "#{RAILS_ROOT}/public/stylesheets/protomultiselect.css"
    if File.exists?(dest) && File.exists?(dest2)
      # upgrade
      begin
        puts "Removing file #{dest}..."
        FileUtils.rm dest
        puts "Removing file #{dest2}..."
        FileUtils.rm dest2
        puts "Installing facebook-select version #{VERSION} to #{dest}..."
        FileUtils.cp "#{src}/javascripts/facebooklist.js", dest
        FileUtils.cp "#{src}/stylesheets/protomultiselect.css", dest2
        puts "Successfully updated facebook-select to version #{VERSION}."
      rescue
        puts "ERROR: Problem updating facebook-select. Please manually copy "
        puts "#{src}/javascripts/facebooklist.js"
        puts "to"
        puts "#{dest}"
        puts "and"
        puts "#{src}/stylesheets/protomultiselect.css"
        puts "to"
        puts "#{dest2}"        
      end
    else
      # install
      begin
        puts "Installing javascript version #{VERSION} to #{dest}..."
        FileUtils.cp "#{src}/javascripts/facebooklist.js", dest
        puts "Installing stylesheet version #{VERSION} to #{dest}..."        
        FileUtils.cp "#{src}/stylesheets/protomultiselect.css", dest2
        puts "Successfully installed facebook-select version #{VERSION}."
      rescue
        puts "ERROR: Problem updating facebook-select. Please manually copy "
        puts "#{src}/javascripts/facebooklist.js"
        puts "to"
        puts "#{dest}"
        puts "and"
        puts "#{src}/stylesheets/protomultiselect.css"
        puts "to"
        puts "#{dest2}"        
      end
    end
  end
end
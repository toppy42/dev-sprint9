require 'github_api'
require "#{Dir.pwd}/config"

github = Github.new basic_auth: "#{USERNAME}:#{PASSWORD}"
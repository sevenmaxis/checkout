begin
  require 'rubygems'
  require 'bundler/setup'
  Bundler.require
rescue LoadError
  abort 'Install bundler `gem install bundler`'
rescue Bundler::GemNotFound, Gem::LoadError
  abort 'Run `bundle install`'
end

require File.expand_path('../../lib/checkout', __FILE__)


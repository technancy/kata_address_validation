#!/usr/bin/env ruby
# -*- ruby -*-

require 'rake/clean'
require 'rake/testtask'


task :default => :spec

task :spec do
  sh 'rspec --color --format documentation jobs_spec.rb'
end
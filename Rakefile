require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

task :mutant do
  require 'mutant'
  ENV['NO_COVERAGE'] = 'true'
  Mutant::CLI.run %w[
    --include lib
    --require smd
    --use rspec
    SmD*
  ]
end

task :default => :spec

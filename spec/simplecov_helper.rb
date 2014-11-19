unless ENV['NO_COVERAGE']
  require 'simplecov'
  SimpleCov.minimum_coverage 100
  SimpleCov.start

  SimpleCov.at_exit do
    SimpleCov.result.format!
    if SimpleCov.result.covered_percent < SimpleCov.minimum_coverage
      fail_msg = "#{'%.2f' % SimpleCov.result.covered_percent}% test coverage."
      STDERR.puts "\033[0;31m#{fail_msg}\033[0m\nWrite more tests"
      exit 1
    end
  end
end
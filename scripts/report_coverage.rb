require 'simplecov'

SimpleCov.collate Dir[ENV.fetch('COVERAGE_RESULT_FILE_PATH_PATTERN')], 'rails'

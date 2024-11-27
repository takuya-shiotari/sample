require 'simplecov'

SimpleCov.collate Dir[ENV.fetch('COVERAGE_JSON_FILE_PATH_PATTERN')], 'rails' do
  add_filter 'app/models/legacy'
  add_group 'Forms', 'app/forms'
  add_group 'Serializers', 'app/serializers'
end

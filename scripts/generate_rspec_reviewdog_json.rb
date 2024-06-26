$LOAD_PATH.unshift 'spec'
ENV['SKIP_DB_MIGRATION'] = '1'
require 'rails_helper'

Dir.glob('spec/**/*_spec.rb').each do |file_path|
  require_relative "../#{file_path}"
end

# @param example_group [RSpec::Core::ExampleGroup]
# @param full_description_to_line_number [Hash{String => Integer}]
def traverse_example_group(example_group, full_description_to_line_number)
  example_group.examples.each do |example|
    full_description_to_line_number[example.metadata[:full_description]] = example.metadata[:line_number]
  end
  example_group.children.each do |child_example_group|
    traverse_example_group(child_example_group, full_description_to_line_number)
  end
end

full_description_to_line_number = {}
RSpec::ExampleGroups.constants.each do |constant|
  example_group = RSpec::ExampleGroups.const_get(constant)
  traverse_example_group(example_group, full_description_to_line_number)
end

require 'nokogiri'

# @param junit_xml_file_path [String]
# @param full_description_to_line_number [Hash{String => Integer}]
# @return [Array<Hash>]
def generate_reviewdog_rows(junit_xml_file_path, full_description_to_line_number)
  Nokogiri(File.open(junit_xml_file_path)).css('testsuite testcase failure').map do |failure_elem|
    elem = failure_elem.parent
    {
      message: failure_elem.text,
      location: {
        path: elem.attr('file'),
        range: {
          start: {
            line: full_description_to_line_number[elem.attr('name')]
          }
        }
      }
    }
  end
end

File.open(ENV['OUTPUT_FILE_PATH'], 'w') do |f|
  Dir.glob(ENV['JUNIT_XML_FILE_PATH_PATTERN']).each do |junit_xml_file_path|
    rows = generate_reviewdog_rows(junit_xml_file_path, full_description_to_line_number)
    f.puts(rows.map(&:to_json).join("\n")) if rows.present?
  end
end

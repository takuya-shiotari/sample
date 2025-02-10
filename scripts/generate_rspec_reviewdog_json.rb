require 'nokogiri'
require 'json'

# JUnit XMLファイルからRDFormatのデータを生成する
# @param junit_xml_file_path [String]
# @return [Array<Hash>]
def parse_junit_failures(junit_xml_file_path)
  Nokogiri(File.open(junit_xml_file_path)).css('testsuite testcase failure').map do |failure_elem|
    elem = failure_elem.parent
    path = elem.attr('file')
    {
      message: failure_elem.text,
      location: {
        path: path,
        range: {
          start: {
            line: elem.attr('line').to_i
          }
        }
      }
    }
  end
end

Dir[ENV.fetch('JUNIT_XML_FILE_PATH_PATTERN', 'test_results/**/*.xml')].each do |junit_xml_file_path|
  rows = parse_junit_failures(junit_xml_file_path)
  puts rows.map(&:to_json).join("\n") unless rows.empty?
end

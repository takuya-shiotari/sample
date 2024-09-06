require 'nokogiri'

suffix = ARGV[0] || '_old'

# @param pattern [String]
# @param suffix [String]
def rename_files_with_suffix(pattern, suffix:)
  Dir[pattern].each do |path|
    ext = File.extname(path)
    new_path = path.gsub(/#{Regexp.escape(ext)}\Z/, "#{suffix}#{ext}")
    File.rename(path, new_path)
  end
end

# @param pattern [String]
def remove_testcase_failures_from_junit_xml_files(pattern)
  Dir[pattern].each do |path|
    content = Nokogiri(File.read(path)).tap { _1.css('testcase:has(failure)').remove }.to_s
    File.write(path, content)
  end
end

rename_files_with_suffix('coverage/**/.*.json', suffix: suffix)
rename_files_with_suffix('test_results/**/*.xml', suffix: suffix)
remove_testcase_failures_from_junit_xml_files('test_results/**/*.xml')

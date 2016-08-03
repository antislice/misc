# helper script originally used to surface bad characters I found at the
# beginning of the caltrain txt files
file_name = ARGV.first

if file_name.nil?
  puts 'please pass in a file'
  exit 1
end

unless File.exist? file_name
  puts 'could not find file'
  exit
end

string = File.read(file_name)
puts string.encoding
string.encode!('UTF-8', undef: :replace, invalic: :replace, replace: '')
# string.encode!('UTF-8')
puts string.encoding
File.open(file_name, 'w') do |f|
  f.puts string
end

require 'mime-types'
require 'netrc'
require 'http-cookie'
require 'rest-client'
require 'rbconfig'
require "open-uri"

response = RestClient.post 'http://turbo.deepart.io/api/post/', 
                        { 
                          style: ARGV[1],
                          return_url: 'http://my.return/',
                          input_image: File.open(ARGV[0], 'rb') 
                        }

img = response.body
link = "http://turbo.deepart.io/media/output/#{img}.jpg"

puts link

max_num_seconds = 20

max_num_seconds.times do |i|
  sleep(1)

  begin
    open("#{img}.jpg", 'wb') do |f|
      f << open(link).read
    end

    if (RbConfig::CONFIG['host_os'] =~ /mswin|mingw|cygwin/)
      system Dir.glob(File.join(Dir.pwd, "#{img.jpg}")), ''  # windows
    else
      system %{open "./#{img}.jpg"} #linux / mac os
    end

    break
  rescue
    puts "Try ##{i}: Retrieving image failed (deepart-api needs more time). Trying again after 1s."
  end
end
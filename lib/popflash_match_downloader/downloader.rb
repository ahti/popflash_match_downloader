require 'net/http'

module PopflashMatchDownloader
  class Downloader
    def initialize download_directory
      @download_directory = File.expand_path(download_directory)
    end

    def file_path name
      File.join @download_directory, name
    end

    def is_file_downloaded? name
      File.exist? file_path(name)
    end

    def download_file name
      file_location = '/' + name

      Net::HTTP.start('s3.popflash.site') do |http|
        http.request_get file_location do |response|
          while response.is_a? Net::HTTPRedirection
            location = response['location']
            puts "redirecting to #{location}"
            response = http.request_get location
          end

          if response.is_a? Net::HTTPSuccess
            File.open file_path(name), 'wb' do |f|
              response.read_body { |seg| f.write seg }
            end
          else
            puts "couldn't donwload demo. error: #{response.message}"
          end
        end
      end
    end

    def download_file_if_needed name
      if is_file_downloaded? name
        puts "already downloaded #{name}"
        return
      end

      puts "downloading #{name}"
      download_file name
    end
  end
end

require 'nokogiri'
require 'open-uri'

module PopflashMatchDownloader
  POPFLASH_SITE_URL = 'https://popflash.site/'

  class UnexpectedContentError
  end
end

require 'popflash_match_downloader/match_file_name_extractor'
require 'popflash_match_downloader/recent_matches_extractor'
require 'popflash_match_downloader/downloader'

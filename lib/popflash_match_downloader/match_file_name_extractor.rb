module PopflashMatchDownloader
  class MatchFileNameExtractor
    def initialize match_id
      @match_id = match_id
    end

    DEMO_LINK_REGEX = %r{^http://s3.popflash.site/([[:graph:]]+.dem)$}
    MATCH_URL_PREFIX = POPFLASH_SITE_URL + 'match/'

    def extract_file_name
      match_url = MATCH_URL_PREFIX + @match_id

      doc = Nokogiri::HTML open(match_url)

      link = doc.css('a.demo-download').first
      raise UnexpectedContentError if link == nil

      match_id_match = link['href'].match(DEMO_LINK_REGEX)
      raise UnexpectedContentError if match_id_match == nil

      match_id_match.captures.first
    end
  end
end

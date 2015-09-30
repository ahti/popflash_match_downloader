module PopflashMatchDownloader
  class RecentMatchesExtractor
    def initialize user_id
      @user_id = user_id
    end

    MATCH_LINK_REGEX = %r{^/match/([[:graph:]&&[^/]]+)$}
    USER_URL_PREFIX = POPFLASH_SITE_URL + 'user/'

    class MatchLinkCssFilter
      def isMatchLink node_set
        node_set.find_all { |n| n['href'] =~ RecentMatchesExtractor::MATCH_LINK_REGEX }
      end
    end

    def find_match_ids
      profile_url = USER_URL_PREFIX + @user_id

      doc = Nokogiri::HTML open(profile_url)
      doc.css('a:isMatchLink', MatchLinkCssFilter.new).map do |l|
        l['href'].match(MATCH_LINK_REGEX).captures.first
      end
    end
  end
end

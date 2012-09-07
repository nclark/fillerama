module Fillerama
  class Client
    attr_reader :source, :count

    def initialize(opts={})
      @source  = opts[:source]
      @count   = opts[:count] || 1
    end

    def quotes
      data   = JSON.parse(RestClient.get 'http://api.chrisvalleskey.com/fillerama/get.php', params)
      quotes = data['db'].map {|e| e['quote']}

      coder = HTMLEntities.new
      CGI.unescapeHTML(coder.decode(quotes.join(' ')))
    end

    private

    def params
      { params: { show: source, count: count, format: 'json' } }
    end
  end
end

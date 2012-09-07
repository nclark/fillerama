module Fillerama
  module CLI
    extend self

    def parse!(args)
      options = {}

      opts = ::OptionParser.new do |opts|
        opts.banner = "\033[1m\033[32mFillerama\033[0m\033[0m: A Filler Text Generator\n\nUsage: fillerama [options]"

        opts.on('-c', '--count COUNT', 'Number of quotes to retrieve (default is 5)') {|c| options[:count] = c.to_i}
        opts.on('-d', '--dexter', 'Dexter') {options[:source] = 'dexter'}
        opts.on('-D', '--doctorwho', 'Doctor Who') {options[:source] = 'doctorwho'}
        opts.on('-f', '--futurama', 'Futurama (default)') {options[:source] = 'futurama'}
        opts.on('-h', '--help', 'Display this screen') {puts opts ; puts "\nAPI from Chris Valleskey (http://chrisvalleskey.com/fillerama/)\n\n"; exit}
        opts.on('-H', '--holygrail', 'Monthy Python and the Holy Grail') {options[:source] = 'holygrail'}
        opts.on('-l', '--loremipsum', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.') {options[:source] = 'loremipsum'}
        opts.on('-s', '--simpsons', 'The Simpsons') {options[:source] = 'simpsons'}
        opts.on('-S', '--starwars', 'Star Wars') {options[:source] = 'starwars'}
        opts.on('-v', '--version', 'Print version and exit') { puts "fillerama #{Fillerama::VERSION}"; exit}
      end

      opts.parse!(args)

      options
    end
  end
end

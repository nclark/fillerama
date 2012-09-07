require 'spec_helper'

module Fillerama
  describe Client, :vcr do
    describe 'source option' do
      describe 'given no source' do
        let(:client) { Client.new(count: 1) }

        it 'should return a quote from futurama' do
          client.quotes.should == "No! I want to live! There are still too many things I don't own!"
        end
      end

      describe 'given a source' do
        before do
          @expected_quotes = {
            dexter:     "I'm generally confused most of the time.",
            doctorwho:  "You've swallowed a planet!",
            futurama:   "For one beautiful night I knew what it was like to be a grandmother. Subjugated, yet honored.",
            holygrail:  "Ah, now we see the violence inherent in the system!",
            loremipsum: "Et harum quidem rerum facilis est et expedita distinctio.",
            simpsons:   "Me fail English? That's unpossible.",
            starwars:   "Don't underestimate the Force."
          }
        end

        [:dexter, :doctorwho, :futurama, :loremipsum, :holygrail, :simpsons, :starwars].each do |source|
          context "of #{source}" do
            let(:client) { Client.new(count: 1, source: source) }

            it "should return a quote from #{source}" do
              client.quotes.should == @expected_quotes[source]
            end
          end
        end
      end
    end

    describe 'count option' do
      describe 'given a count' do
        context 'of 1' do
          let(:client) { Client.new(count: 1) }

          it 'should return a single quote' do
            client.quotes.should == "Now, now. Perfectly symmetrical violence never solved anything."
          end
        end

        context 'of 2' do
          let(:client) { Client.new(count: 2) }

          it 'should return two quotes' do
            client.quotes.should == "Spare me your space age technobabble, Attila the Hun! Look, everyone wants to be like Germany, but do we really have the pure strength of 'will'?"
          end
        end

        context 'of 10' do
          let(:client) { Client.new(count: 10) }

          it 'should return ten quotes' do
            client.quotes.should == "I am the man with no name, Zapp Brannigan! We need rest.  The spirit is willing, but the flesh is spongy and bruised. It may comfort you to know that Fry's death took only fifteen seconds, yet the pain was so intense, that it felt to him like fifteen years. And it goes without saying, it caused him to empty his bowels. Look, everyone wants to be like Germany, but do we really have the pure strength of 'will'? Anyone who laughs is a communist! That could be 'my' beautiful soul sitting naked on a couch. If I could just learn to play this stupid thing. Eeeee!  Now say \"nuclear wessels\"! Yeah, and if you were the pope they'd be all, \"Straighten your pope hat.\" And \"Put on your good vestments.\" Tell her you just want to talk. It has nothing to do with mating. Yep, I remember. They came in last at the Olympics, then retired to promote alcoholic beverages!"
          end
        end
      end

      describe 'given no count' do
        let(:client) { Client.new }

        it 'should return a single' do
          client.quotes.should == "Bender, hurry! This fuel's expensive! Also, we're dying!"
        end
      end
    end
  end
end


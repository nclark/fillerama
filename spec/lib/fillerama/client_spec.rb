# -*- encoding: utf-8 -*-

require 'spec_helper'

module Fillerama
  describe Client, :vcr do
    describe 'source option' do
      describe 'given no source' do
        let(:client) { Client.new(count: 1) }

        it 'should return a quote from futurama' do
          client.quotes.should == "Doomsday device? Ah, now the ball's in Farnsworth's court!"
        end
      end

      describe 'given a source' do
        before do
          @expected_quotes = {
            dexter:     "Hello, Dexter Morgan.",
            doctorwho:  "No… It's a thing; it's like a plan, but with more greatness.",
            futurama:   "For one beautiful night I knew what it was like to be a grandmother. Subjugated, yet honored.",
            holygrail:  "And the hat. She's a witch!",
            loremipsum: "Et harum quidem rerum facilis est et expedita distinctio.",
            simpsons:   "Human contact: the final frontier.",
            starwars:   "Partially, but it also obeys your commands."
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
            client.quotes.should == "WINDMILLS DO NOT WORK THAT WAY! GOOD NIGHT!"
          end
        end

        context 'of 2' do
          let(:client) { Client.new(count: 2) }

          it 'should return two quotes' do
            client.quotes.should == "Fetal stemcells, aren't those controversial? Oh, how I wish I could believe or understand that! There's only one reasonable course of action now: kill Flexo!"
          end
        end

        context 'of 10' do
          let(:client) { Client.new(count: 10) }

          it 'should return ten quotes' do
            client.quotes.should == "Ooh, name it after me! But I know you in the future. I cleaned your poop. Oh Leela! You're the only person I could turn to; you're the only person who ever loved me. Oh, I think we should just stay friends. Why would I want to know that? Is today's hectic lifestyle making you tense and impatient? Shut up and take my money! No. We're on the top. I meant 'physically'. Look, perhaps you could let me work for a little food? I could clean the floors or paint a fence, or service you sexually? Oh sure! Blame the wizards!"
          end
        end
      end

      describe 'given no count' do
        let(:client) { Client.new }

        it 'should return a single' do
          client.quotes.should == "Please, Don-Bot… look into your hard drive, and open your mercy file!"
        end
      end
    end
  end
end


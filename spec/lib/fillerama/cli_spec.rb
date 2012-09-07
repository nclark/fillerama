require 'spec_helper'

module Fillerama
  describe CLI do
    context 'given short form options' do
      it 'should parse them correctly' do
        CLI.parse!(['-c', '5'])[:count].should == 5
        CLI.parse!(['-d'])[:source].should == 'dexter'
        CLI.parse!(['-D'])[:source].should == 'doctorwho'
        CLI.parse!(['-f'])[:source].should == 'futurama'
        CLI.parse!(['-H'])[:source].should == 'holygrail'
        CLI.parse!(['-l'])[:source].should == 'loremipsum'
        CLI.parse!(['-s'])[:source].should == 'simpsons'
        CLI.parse!(['-S'])[:source].should == 'starwars'
      end
    end

    describe 'given long form options' do
      it 'should parse them correctly' do
        CLI.parse!(['--count', '5'])[:count].should == 5
        CLI.parse!(['--dexter'])[:source].should == 'dexter'
        CLI.parse!(['--doctorwho'])[:source].should == 'doctorwho'
        CLI.parse!(['--futurama'])[:source].should == 'futurama'
        CLI.parse!(['--holygrail'])[:source].should == 'holygrail'
        CLI.parse!(['--loremipsum'])[:source].should == 'loremipsum'
        CLI.parse!(['--simpsons'])[:source].should == 'simpsons'
        CLI.parse!(['--starwars'])[:source].should == 'starwars'
      end
    end
  end
end

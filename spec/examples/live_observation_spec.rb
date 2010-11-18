require File.dirname(__FILE__) + '/spec_helper'

describe Weatherbug::LiveObservation do

  before(:all) do
    @live_observation = Weatherbug::live_observation('AWSHQ')
  end

  it 'should have the fields that live observations should have' do
    [:temp_high, :temp_low].each { |k| @live_observation.send(k).should be_a(Fixnum) }
    [:station_id, :temp_units].each { |k| @live_observation.send(k).should be_a(String) }
  end

  it 'should be able to take a live observation and get its city' do
    @live_observation.station.should be_a(Weatherbug::Station)
  end

end

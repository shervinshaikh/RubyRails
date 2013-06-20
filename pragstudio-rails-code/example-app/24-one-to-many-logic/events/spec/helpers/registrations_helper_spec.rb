require 'spec_helper'

describe RegistrationsHelper do
  describe "#register_link" do
    context "when the event is sold out" do
      it "returns 'Sold Out'" do
        event = Event.new(event_attributes(capacity: 0))
        
        register_link_for(event).should =~ /Sold Out/
      end
    end
    
    context "when the event has spots left" do
      it "returns the register link" do
        event = Event.new(event_attributes(capacity: 1))
        event.save
        
        register_link_for(event).should =~ /Register/
      end
    end
  end
end
require 'spec_helper'

describe EventsHelper do
  describe "#format_price" do
    context "when the event has a positive price" do
      it "returns the numerical price value" do
        event = Event.new(event_attributes(price: 10.00))
        
        format_price(event).should == "$10.00"
      end
    end
    
    context "when the event has a zero price" do
      it "returns 'Free'" do
        event = Event.new(event_attributes(price: 0.00))
        
        format_price(event).should =~ /Free/
      end
    end
  end
end
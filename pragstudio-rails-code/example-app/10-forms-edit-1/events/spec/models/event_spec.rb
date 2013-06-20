require 'spec_helper'

describe "An event" do
  it "is free if the price is $0" do
    event = Event.new(price: 0)
    
    expect(event).to be_free
  end
  
  it "is not free if the price is non-$0" do
    event = Event.new(price: 10)
    
    expect(event).not_to be_free    
  end
end
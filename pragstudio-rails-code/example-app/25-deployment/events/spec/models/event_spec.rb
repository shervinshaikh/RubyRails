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
  
  it "requires a name" do
    event = Event.new(name: "")
    
    expect(event.valid?).to be_false # populates errors
    expect(event.errors[:name].any?).to be_true
  end
  
  it "requires a description" do
    event = Event.new(description: "")
    
    expect(event.valid?).to be_false
    expect(event.errors[:description].any?).to be_true
  end
  
  it "requires a location" do
    event = Event.new(location: "")
    
    expect(event.valid?).to be_false
    expect(event.errors[:location].any?).to be_true
  end
  
  it "requires a description over 24 characters" do
    event = Event.new(description: "X" * 24)
    
    expect(event.valid?).to be_false
    expect(event.errors[:description].any?).to be_true
  end
  
  it "accepts a $0 price" do
    event = Event.new(price: 0.00)

    expect(event.valid?).to be_false
    expect(event.errors[:price].any?).to be_false
  end
  
  it "accepts a positive price" do
    event = Event.new(price: 10.00)

    expect(event.valid?).to be_false
    expect(event.errors[:price].any?).to be_false
  end
  
  it "rejects a negative price" do
    event = Event.new(price: -10.00)

    expect(event.valid?).to be_false
    expect(event.errors[:price].any?).to be_true
  end
  
  it "rejects a 0 capacity" do
    event = Event.new(capacity: 0)

    expect(event.valid?).to be_false
    expect(event.errors[:capacity].any?).to be_true
  end
  
  it "accepts a positive capacity" do
    event = Event.new(capacity: 5)

    expect(event.valid?).to be_false
    expect(event.errors[:capacity].any?).to be_false
  end
  
  it "rejects a negative capacity" do
    event = Event.new(capacity: -5)

    expect(event.valid?).to be_false
    expect(event.errors[:capacity].any?).to be_true
  end
  
  it "rejects a non-integer capacity" do
    event = Event.new(capacity: 3.14159)

    expect(event.valid?).to be_false
    expect(event.errors[:capacity].any?).to be_true
  end
  
  it "accepts properly formatted image file names" do
    file_names = %w[e.png event.png event.jpg event.gif EVENT.GIF]
    file_names.each do |file_name|
      event = Event.new(image_file_name: file_name)
      
      expect(event.valid?).to be_false
      expect(event.errors[:image_file_name].any?).to be_false
    end
  end
  
  it "reject improperly formatted image file names" do
    file_names = %w[event .jpg .png .gif event.pdf event.doc]
    file_names.each do |file_name|
      event = Event.new(image_file_name: file_name)
      
      expect(event.valid?).to be_false
      expect(event.errors[:image_file_name].any?).to be_true
    end
  end

  it "accepts prices that are multiples of fifty cents" do
    prices = [0.00, 1.00, 1.50]
    prices.each do |price|
      event = Event.new(price: price)
      
      expect(event.valid?).to be_false
      expect(event.errors[:price].any?).to be_false
    end
  end
  
  it "rejects prices that are not multiples of fifty cents" do
    prices = [1.10, 1.25, 1.75]
    prices.each do |price|
      event = Event.new(price: price)
      
      expect(event.valid?).to be_false
      expect(event.errors[:price].any?).to be_true
    end
  end
  
  it "with example attributes is valid" do
    event = Event.new(event_attributes)
    
    expect(event.valid?).to be_true
  end
  
  it "has many registrations" do
    event = Event.new(event_attributes)
    
    registration1 = event.registrations.new(registration_attributes)
    registration2 = event.registrations.new(registration_attributes)
        
    expect(event.registrations).to include(registration1)
    expect(event.registrations).to include(registration2)
  end
  
  it "deletes associated registrations" do
    event = Event.create(event_attributes)
    
    event.registrations.create(registration_attributes)
    
    expect { 
      event.destroy
    }.to change(Registration, :count).by(-1)
  end
  
  it "is sold out if no spots are left" do
    event = Event.new(event_attributes(capacity: 0))

    expect(event.sold_out?).to be_true
  end
  
  it "is not sold out if spots are available" do
    event = Event.new(event_attributes(capacity: 10))

    expect(event.sold_out?).to be_false
  end
  
  it "decrements spots left when a registration is created" do
    event = Event.create(event_attributes)
    
    event.registrations.create(registration_attributes)
    
    expect { 
      event.registrations.create(registration_attributes)
    }.to change(event, :spots_left).by(-1)
  end
  
end

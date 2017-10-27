require 'rails_helper'

RSpec.describe Notification, :type => :model do
  subject { described_class.new(
      content: "Pippo",
      time: "15:15",
      ntype: "1"
      ) }
    
    it "is not valid without content" do
        subject.content = nil
        expect(subject).to_not be_valid
    end
    
    it "is not valid without type" do
        subject.ntype = nil
        expect(subject).to_not be_valid
    end
    
    it "type is not valid with letters" do
        subject.ntype= "aa"
        expect(subject).to_not be_valid
    end
    
    it "is not valid without time" do
        subject.time = nil
        expect(subject).to_not be_valid
    end
    
    it "time is not valid with letters" do
        subject.time= "aa"
        expect(subject).to_not be_valid
    end
end

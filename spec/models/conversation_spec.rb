require 'rails_helper'

RSpec.describe Conversation, :type => :model do
  subject { described_class.new(
      sender_id: "1",
      recipient_id: "2"
      ) }
    
    
    it "is not valid without sender id" do
        subject.sender_id = nil
        expect(subject).to_not be_valid
    end
    
    it "is not valid without recipient id" do
        subject.recipient_id = nil
        expect(subject).to_not be_valid
    end
    
    
end
require 'rails_helper'

RSpec.describe Message, :type => :model do
  subject { described_class.new(
      body: "Ciao",
      user_id: "1"
      ) }
    
    it "is not valid without a body" do
        subject.body = nil
        expect(subject).to_not be_valid
    end
    
    it "is not valid without id" do
        subject.user_id = nil
        expect(subject).to_not be_valid
    end
    
end
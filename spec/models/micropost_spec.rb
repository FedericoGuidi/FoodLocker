require 'rails_helper'

RSpec.describe Micropost, :type => :model do
  subject { described_class.new(
      content: "Ciao"
      
      ) }
    
    it "is not valid without a content" do
        subject.content = nil
        expect(subject).to_not be_valid
    end
    
end
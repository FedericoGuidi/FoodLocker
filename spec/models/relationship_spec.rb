require 'rails_helper'

RSpec.describe Relationship, :type => :model do
  subject { described_class.new(
      follower_id: "111",
      followed_id: "222"
      
      ) }
    
    it "is not valid without a follower_id" do
        subject.follower_id = nil
        expect(subject).to_not be_valid
    end
    
    
    it "is not valid without a followed_id" do
        subject.followed_id = nil
        expect(subject).to_not be_valid
    end
    
end
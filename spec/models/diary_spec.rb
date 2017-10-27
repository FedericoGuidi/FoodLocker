require 'rails_helper'

RSpec.describe Diary, :type => :model do
  subject { described_class.new(
      user_id: "1"
      ) }
    
    
    it "is not valid without id" do
        subject.user_id = nil
        expect(subject).to_not be_valid
    end
end

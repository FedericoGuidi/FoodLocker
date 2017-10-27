require 'rails_helper'

RSpec.describe Day, :type => :model do
  subject { described_class.new(
      breakfast: "colazione",
      breakfast_kcal: "100",
      snack: "snack",
      snack_kcal: "200",
      lunch: "lunch",
      lunch_kcal: "500",
      dinner: "dinner",
      dinner_kcal: "400"
      ) }
    
    it "is not valid without breakfast" do
        subject.breakfast = nil
        expect(subject).to_not be_valid
    end
    
    it "is not valid without breakfast_kcal" do
        subject.breakfast_kcal = nil
        expect(subject).to_not be_valid
    end
    
    it "is not valid without a snack" do
        subject.snack = nil
        expect(subject).to_not be_valid
    end
    
    it "is not valid without snack_kcal" do
        subject.snack_kcal = nil
        expect(subject).to_not be_valid
    end
    
    it "is not valid without lunch" do
        subject.lunch = nil
        expect(subject).to_not be_valid
    end
    
    it "is not valid without lunch_kcal" do
        subject.lunch_kcal = nil
        expect(subject).to_not be_valid
    end
    
    it "is not valid without dinner" do
        subject.dinner = nil
        expect(subject).to_not be_valid
        
    end
    
    it "is not valid without dinner_kcal" do
        subject.dinner_kcal = nil
        expect(subject).to_not be_valid
    end
    
end
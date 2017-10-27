require 'rails_helper'

RSpec.describe Quiz, :type => :model do
  subject { described_class.new(
      name: "Pippo",
      gender: "M",
      height: "1.70",
      weight: "65",
      age: "20",
      water: "3",
      sport: true,
      sport_time: "45",
      target_weight: "60",
      kcal: "1300"
      ) }
    
    it "is not valid without a name" do
        subject.name = nil
        expect(subject).to_not be_valid
    end
    
    it "name should not be too long" do
        subject.name = "a" * 51
        expect(subject).to_not be_valid
    end
    
    
    it "name is not valid with numbers" do
        subject.name= "11"
        expect(subject).to_not be_valid
    end

    it "is not valid without a gender" do
        subject.gender = nil
        expect(subject).to_not be_valid
    end
    
    it "is not valid without height" do
        subject.height = nil
        expect(subject).to_not be_valid
    end
    
    it "height should not be too long" do
        subject.height = "3" * 11
        expect(subject).to_not be_valid
    end
    
    it "height is not valid with ," do
        subject.height = "3,6"
        expect(subject).to_not be_valid
    end
    
    it "height is not valid with letters" do
        subject.height = "aa"
        expect(subject).to_not be_valid
    end
    
    it "is not valid without weight" do
        subject.weight = nil
        expect(subject).to_not be_valid
    end
    
    it "weight is not valid with letters" do
        subject.weight = "aa"
        expect(subject).to_not be_valid
    end
    
    it "weight should not be too long" do
        subject.weight = "3" * 11
        expect(subject).to_not be_valid
    end
    
    it "weight is not valid with ," do
        subject.weight = "3,6"
        expect(subject).to_not be_valid
    end
    
    it "is not valid without age" do
        subject.age = nil
        expect(subject).to_not be_valid
    end
    
    it "age is not valid with letters" do
        subject.age = "aa"
        expect(subject).to_not be_valid
    end
    
    it "age should not be too long" do
        subject.age = "3" * 3
        expect(subject).to_not be_valid
    end
    
    it "is not valid without water" do
        subject.water = nil
        expect(subject).to_not be_valid
    end
    
    it "water is not valid with letters" do
        subject.water = "aa"
        expect(subject).to_not be_valid
    end
    
    it "water is not valid with ," do
        subject.water = "3,6"
        expect(subject).to_not be_valid
    end
    
    it "is not valid without target_weight" do
        subject.target_weight = nil
        expect(subject).to_not be_valid
    end
    
    it "target_weight is not valid with letters" do
        subject.target_weight = "aa"
        expect(subject).to_not be_valid
    end
    
    it "target_weight is not valid with ," do
        subject.target_weight = "3,6"
        expect(subject).to_not be_valid
    end
    
    it "is not valid without kcals" do
        subject.kcal = nil
        expect(subject).to_not be_valid
    end
    
    it "kcal is not valid with letters" do
        subject.kcal = "aa"
        expect(subject).to_not be_valid
    end
    
    it "kcal should not be too long" do
        subject.kcal = "a" * 6
        expect(subject).to_not be_valid
    end
    
    it "kcal is not valid with ," do
        subject.kcal = "3,6"
        expect(subject).to_not be_valid
    end
    
end
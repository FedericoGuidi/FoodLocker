require 'rails_helper'

RSpec.describe Recipe, :type => :model do
  subject { described_class.new(
      title: "Ricetta",
      kcal: "200",
      ingredients: "cibo",
      directions: "procedura"
      ) }
    
    it "is not valid without a title" do
        subject.title = nil
        expect(subject).to_not be_valid
    end
    
    it "is not valid without kcals" do
        subject.kcal = nil
        expect(subject).to_not be_valid
    end
    
    it "kcal is not valid with letters" do
        subject.kcal="aa"
        expect(subject).to_not be_valid
    end
    
    it "kcal is not valid with ," do
        subject.kcal = "3,6"
        expect(subject).to_not be_valid
    end
    
    it "is not valid without ingredients" do
        subject.ingredients = nil
        expect(subject).to_not be_valid
    end
    
    it "is not valid without directions" do
        subject.directions = nil
        expect(subject).to_not be_valid
    end
    
    it "kcal is not valid with letters" do
        subject.kcal= "aa"
        expect(subject).to_not be_valid
    end
    
end
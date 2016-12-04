require 'rails_helper'

RSpec.describe Quote, type: :model do
  before(:all) do
    Rails.application.load_seed
  end

  it "has a valid factory" do
    expect(build(:quote)).to be_valid
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:state_id) }
    it { should validate_numericality_of(:state_id).is_less_than_or_equal_to(51) }
    it { should validate_presence_of(:age) }
    it { should validate_presence_of(:gender) }
  end

  describe "associations" do
    it { should belong_to(:state) }
    it { should have_many(:quote_conditions) }
    it { should have_many(:conditions).through(:quote_conditions) }
  end

  describe "instance methods" do
    describe "#add_condition" do
      before(:all) do
        Quote.find_by(name: "Kelly").add_condition(2)
      end

      it "adds the correct condition id" do
        expect(QuoteCondition.last.condition_id).to eq(2)
      end

      it "adds the correct quote id" do
        expect(QuoteCondition.last.quote_id).to eq(Quote.find_by(name: "Kelly").id)
      end
    end

    describe "#conditions_cost_percentage" do
      it "calculates correct conditions cost percentage for one condition" do
        expect(Quote.find_by(name: "Josh").conditions_cost_percentage).to eq(6)
      end

      it "calculates correct conditions cost percentage for no conditions" do
        expect(Quote.find_by(name: "Brad").conditions_cost_percentage).to eq(0)
      end

      it "calculates correct conditions cost percentage for two conditions" do
        expect(Quote.find_by(name: "Jan").conditions_cost_percentage).to eq(25)
      end
    end

    describe "#age_cost" do
      it "calculates correct age cost for 40 year old" do
        expect(build(:quote).age_cost).to eq(80)
      end

      it "calculates correct age cost for 22 year old" do
        expect(build(:quote, age: 22).age_cost).to eq(0)
      end
    end

    describe "#generate_price" do
      it "calculates correct price for one health condition" do
        expect(Quote.find_by(name: "Josh").generate_price).to eq(190.8)
      end

      it "calculates correct price for no health conditions" do
        expect(Quote.find_by(name: "Brad").generate_price).to eq(100)
      end

      it "calculates correct price for multiple health conditions" do
        expect(Quote.find_by(name: "Jan").generate_price).to eq(154.25)
      end

      it "calculates correct price for ineligible age" do
        expect(Quote.find_by(name: "Petr").generate_price).to eq(-1)
      end
    end
  end
end

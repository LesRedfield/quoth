require 'rails_helper'

RSpec.describe QuotesController, type: :controller do
  before(:all) do
    Rails.application.load_seed
  end

  describe "GET #new" do
    it "renders the new quotes page" do
      get :new, quote: {}

      expect(response).to render_template("new")
      expect(response).to have_http_status(200)
    end
  end

  describe "POST #create" do
    context "with invalid params" do
      it "validates the presence of age" do
        post :create, quote: { name: "Alan", state_id: 5, gender: "male" }
        expect(response).to render_template("new")
        expect(flash[:errors]).to be_present
      end
    end

    context "with valid params" do
      it "renders the new quotes page" do
        post :create, quote: { name: "Alan", state_id: 5, age: 30, gender: "male" }
        expect(response).to render_template("new")
      end
    end
  end
end

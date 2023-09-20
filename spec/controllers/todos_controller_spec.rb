require 'rails_helper'

RSpec.describe TodosController, type: :controller do
  describe "GET #index" do
    before do
      FactoryBot.create_list(:todo, 3)
      get :index
    end

    it "returns a successful response" do
      expect(response).to be_successful
    end

    it "returns all todos" do
      expect(JSON.parse(response.body).size).to eq(3)
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "creates a new todo" do
        expect {
          post :create, params: { todo: FactoryBot.attributes_for(:todo) }
        }.to change(Todo, :count).by(1)
      end
    end

    context "with invalid attributes" do
      it "does not create a new todo" do
        expect {
          post :create, params: { todo: { title: nil } }
        }.to_not change(Todo, :count)
      end
    end
  end
end

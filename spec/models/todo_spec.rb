require 'rails_helper'

RSpec.describe Todo, type: :model do
  it "is valid with a title" do
    todo = FactoryBot.build(:todo)
    expect(todo).to be_valid
  end

  it "is invalid without a title" do
    todo = FactoryBot.build(:todo, title: nil)
    todo.valid?
    expect(todo.errors[:title]).to include("can't be blank")
  end
end

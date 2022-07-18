require'rails_helper'

RSpec.describe UsersSearchForm, type: :model do

  before do
    @pre1 = Prefecture.create(name: "北海道")
    pre2 = Prefecture.create(name: "東京都")
    pre3 = Prefecture.create(name: "大阪府")

    user1 = User.create(first_name: "Jhon", last_name: "Smith", born_on: "1994-06-26")
    user1.create_birthplace(prefecture_id: @pre1.id, detail: "test town")

    user2 = User.create(first_name: "Ben", last_name: "Greenholt", born_on: "1998-11-26")
    user2.create_birthplace(prefecture_id: pre2.id, detail: "test town")

    user3 = User.create(first_name: "Lawana", last_name: "Torp", born_on: "1995-11-26")
    user3.create_birthplace(prefecture_id: pre3.id, detail: "test town")
  end

  it "first name" do
    user_form = UsersSearchForm.new(
      first_name: "a"
    )
    results = user_form.search
    expect(results.size).to eq 1
  end

  it "last name" do
    user_form = UsersSearchForm.new(
      last_name: "o"
    )
    results = user_form.search
    expect(results.size).to eq 2
  end

  it "born on year" do
    user_form = UsersSearchForm.new(
      born_on_year: 1998
    )
    results = user_form.search
    expect(results.size).to eq 1
  end

  it "born on month" do
    user_form = UsersSearchForm.new(
      born_on_month: 11
    )
    results = user_form.search
    expect(results.size).to eq 2
  end

  it "prefecture" do
    user_form = UsersSearchForm.new(
      prefecture_id: @pre1.id
    )
    results = user_form.search
    expect(results.size).to eq 1
  end


end
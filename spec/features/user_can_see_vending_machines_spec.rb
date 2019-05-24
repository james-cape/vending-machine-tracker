require 'rails_helper'

RSpec.describe "When a user visits the vending machine index", type: :feature do
  scenario "they see a list of vending machine locations" do
    sam = Owner.create(name: "Sam's Snacks")
    sam.machines.create(location: "Don's Mixed Drinks")
    sam.machines.create(location: "Turing Basement")

    visit owner_machines_path(sam)

    expect(page).to have_content("Don's Mixed Drinks")
    expect(page).to have_content("Turing Basement")
  end
end

# User Story 1 of 3
#
# As a user
# When I visit a vending machine show page
# I see the name of all of the snacks associated with that vending machine along with their price
RSpec.describe "When a user visits the vending machine show page", type: :feature do
  scenario "they see the name of all of the snacks associated with that vending machine along with their price" do
    sam = Owner.create(name: "Sam's Snacks")
    machine_1 = sam.machines.create(location: "Don's Mixed Drinks")
    machine_2 = sam.machines.create(location: "Turing Basement")
#
    snack_1 = machine_1.snacks.create(name: "Mars Bar", price: 2.40)
    snack_2 = machine_1.snacks.create(name: "Snickers Bar", price: 4.40)
    snack_3 = machine_1.snacks.create(name: "Kit Kat Bar", price: 6.40)
    snack_4 = machine_2.snacks.create(name: "100Grand Bar", price: 8.40)
    snack_5 = machine_2.snacks.create(name: "Reeses Bar", price: 10.40)
    snack_6 = machine_2.snacks.create(name: "Ice Cream Bar", price: 98.40)

    visit machine_path(machine_1)

    within "#snack-display" do
      expect(page).to have_content("Mars Bar")
      expect(page).to have_content("Snickers Bar")
      expect(page).to have_content("Kit Kat Bar")
      expect(page).to_not have_content("100Grand Bar")
    end

  end
end

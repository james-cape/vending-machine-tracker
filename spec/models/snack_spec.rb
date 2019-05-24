require 'rails_helper'

RSpec.describe Snack, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :price }
    it { should have_many :machines }
  end

  describe 'average price method' do
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


    expect(machine_1.average_price).to eq(4.4)
  end
end

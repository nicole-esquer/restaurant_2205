require './lib/rest'

RSpec.describe Restaurant do
  before (:each) do
    @restaurant = Restaurant.new('10:00', 'Fuel Cafe')
    @restaurant1 = Restaurant.new('10:00', 'Fuel Cafe')
    @restaurant2 = Restaurant.new('16:00', 'Il Poggio')
  end

  it "exists" do
    expect(@restaurant).to be_a(Restaurant)
  end

  it "has attributes" do
    expect(@restaurant.opening_time).to eq("10:00")
    expect(@restaurant.name).to eq("Fuel Cafe")
    expect(@restaurant.dishes).to eq([])
  end

  it "has closing time" do
    expect(@restaurant1.closing_time(8)).to eq("18:00")
    expect(@restaurant2.closing_time(7)).to eq("23:00")
  end

  it "can list dishes" do
    @restaurant2.add_dish('Burrata')
    @restaurant2.add_dish('Pizzetta')
    @restaurant2.add_dish('Ravioli')

    expect(@restaurant2.dishes).to eq(["Burrata", "Pizzetta", "Ravioli"])
  end

  it "is open for lunch" do
    expect(@restaurant1.open_for_lunch?).to eq(true)
    expect(@restaurant2.open_for_lunch?).to eq(false)
  end

  it "can list menu_dish_names in all caps" do
    @restaurant2.add_dish('Burrata')
    @restaurant2.add_dish('Pizzetta')
    @restaurant2.add_dish('Ravioli')

    expect(@restaurant2.menu_dish_names).to eq(["BURRATA", "PIZZETTA", "RAVIOLI"])
  end

  it "can announce_closing_time" do
    expect(@restaurant1.announce_closing_time(5)).to eq("Fuel Cafe will be closing at 11:00AM")
    expect(@restaurant2.announce_closing_time(7)).to eq("Il Posto will be closing at 11:00PM")
  end

end

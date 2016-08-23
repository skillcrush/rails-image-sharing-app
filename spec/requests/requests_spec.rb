require "spec_helper"

RSpec.describe "Our Application Routes" do

describe "GET /pins/name-:slug" do

it "renders the pins/show template" do
pin = Pin.first
get "/pins/name-#{pin.slug}"
expect(response).to render_template("pins/show")
end

it "populates the @pin variable with the appropriate pin" do
	pin = Pin.first
	get "/pins/name-#{pin.slug}"
	expect(assigns[:pin]).to eq(Pin.first)
end


end
  
end
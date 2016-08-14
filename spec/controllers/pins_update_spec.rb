require 'spec_helper'
RSpec.describe PinsController do


describe "PUT update" do
  before(:each) do
    @pin = Pin.first
    @pin_hash = { title: @pin.title,
      url: @pin.url,
      slug: @pin.slug,
      category_id: @pin.category_id,
      text: @pin.text }
  end


  #works for a valid edit

      
  
it "updates a pin" do
  post :update, id: @pin.id, pin: @pin_hash
  new_title = "Rails"
  put("/pins/#{@pin.id}", 
    { title: new_title,
      url: @pin.url,
      slug: @pin.slug,
      category_id: @pin.category_id,
      text: @pin.text })
  expect(@pin.title).to eq(:title)
end


  #does not work for an invalid edit


=begin
    
    it 'creates a pin' do
      post :create, pin: @pin_hash  
      expect(Pin.find_by_slug("rails-wizard").present?).to be(true)
    end
    
    it 'redirects to the show view' do
      post :create, pin: @pin_hash
      expect(response).to redirect_to(pin_url(assigns(:pin)))
    end
    
    it 'redisplays new form on error' do
      # The title is required in the Pin model, so we'll
      # delete the title from the @pin_hash in order
      # to test what happens with invalid parameters
      @pin_hash.delete(:title)
      post :create, pin: @pin_hash
      expect(response).to render_template(:new)
    end
    
    it 'assigns the @errors instance variable on error' do
      # The title is required in the Pin model, so we'll
      # delete the title from the @pin_hash in order
      # to test what happens with invalid parameters
      @pin_hash.delete(:title)
      post :create, pin: @pin_hash
      expect(assigns[:errors].present?).to be(true)
    end    
=end

end

end
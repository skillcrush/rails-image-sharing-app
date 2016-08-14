require 'spec_helper'
RSpec.describe PinsController do

before(:each) do
  @user = FactoryGirl.create(:user)
  login(@user)
  @pin = FactoryGirl.create(:pin)
end

after(:each) do
  if !@user.destroyed?
    @user.destroy
  end
end

describe "GET index" do
	it "renders the index template" do
		get :index
		expect(response).to render_template("index")
	end

	it "populates an instance variable @pins with all pins in the database" do
		get :index
		expect(assigns[:pins]).to eq(Pin.all)
	end

  it "redirects to login if user is not signed in" do
      logout(@user)
      get :index
      expect(response).to redirect_to(:login)
    end
end

describe "GET new" do
    it 'responds with successfully' do
      get :new
      expect(response.success?).to be(true)
    end
    
    it 'renders the new view' do
      get :new      
      expect(response).to render_template(:new)
    end
    
    it 'assigns an instance variable to a new pin' do
      get :new
      expect(assigns(:pin)).to be_a_new(Pin)
    end

    it "redirects to login if user is not signed in" do
      logout(@user)
      get :new
      expect(response).to redirect_to(:login)
    end
  end
  
  describe "POST create" do
    before(:each) do
      @pin_hash = { 
        title: "Rails Wizard", 
        url: "http://railswizard.org", 
        slug: "rails-wizard", 
        text: "A fun and helpful Rails Resource",
        category_id: "rails"}    
    end
    
    after(:each) do
      pin = Pin.find_by_slug("rails-wizard")
      if !pin.nil?
        pin.destroy
      end
    end
    
    it 'responds with a redirect' do
      post :create, pin: @pin_hash
      expect(response.redirect?).to be(true)
    end
    
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
  end


describe "GET edit" do
  before(:each) do
    @pin = Pin.first
  end

  it "responds with success" do
	 get :edit, id: @pin.id
	 expect(response.success?).to be(true)
  end

  it 'renders the edit view' do
      get :edit, id: @pin.id     
      expect(response).to render_template(:edit)
  end

  it "assigns an instance variable called @pin to the Pin with the appropriate id" do
      get :edit, id: @pin.id 
      expect(assigns(:pin)).to eq(@pin)
  end

  it "redirects to login if user is not signed in" do
      logout(@user)
      get :edit, id: @pin.id 
      expect(response).to redirect_to(:login)
  end
end

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

  it 'responds with a redirect' do
      post :update, pin: @pin_hash, id: @pin.id
      expect(response.redirect?).to be(true)
  end

#doesn't work for an invalid edit

  #it '' do
  #end

end

describe "POST repin" do
  before(:each) do
    @user = FactoryGirl.create(:user)
    login(@user)
    @pin = FactoryGirl.create(:pin)
  end

    after(:each) do
      pin = Pin.find_by_slug("rails-wizard")
      if !pin.nil?
        pin.destroy
      end
      logout(@user)
    end

    it 'responds with a redirect' do
      post :repin, pin: @pin, id: @pin.id
      expect(response.redirect?).to be(true)
    end

    it 'creates a user.pin' do
      post :repin, pin: @pin, id: @pin.id, user: @user
      expect(@user.pins(:id).present?).to be(true)
    end

    it 'redirects to the user show page' do
      post :repin, pin: @pin, id: @pin.id, user: @user
      expect(response).to redirect_to(user_path(@user.id))
    end
end


end
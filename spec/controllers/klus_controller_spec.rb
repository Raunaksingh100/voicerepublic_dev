require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe KlusController do

  before do
    @user = FactoryGirl.create(:user)  
  end
  
  # This should return the minimal set of attributes required to create a valid
  # Klu. As you add validations to Klu, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    FactoryGirl.attributes_for(:published_kluuu)
  end
  
 

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # KlusController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all klus as @klus" do
      klu = FactoryGirl.create(:published_kluuu)
      get :index, {:user_id => klu.user }, valid_session 
      assigns(:kluuus).should eq([klu])
    end
  end

  describe "GET show" do
    it "assigns the requested klu as @klu" do
      klu = FactoryGirl.create(:published_kluuu)
      get :show, {:id => klu.to_param}, valid_session
      assigns(:klu).should eq(klu)
    end
  end

  describe "GET new" do
    it "assigns a new klu as @klu" do
      get :new, {:user_id => @user}, valid_session
      assigns(:klu).should be_a_new(Klu)
    end
  end

  describe "GET edit" do
    it "assigns the requested klu as @klu" do
      klu = FactoryGirl.create(:published_kluuu)
      get :edit, {:id => klu.to_param}, valid_session
      assigns(:klu).should eq(klu)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Klu" do
        expect {
          post :create, {:user_id => @user, :klu => valid_attributes.merge(:user_id => @user)}, valid_session
        }.to change(Klu, :count).by(1)
      end

      it "assigns a newly created klu as @klu" do
        post :create, {:user_id => @user, :klu => valid_attributes.merge(:user_id => @user)}, valid_session
        assigns(:klu).should be_a(Klu)
        assigns(:klu).should be_persisted
      end

      it "redirects to the created klu" do
        post :create, {:klu => valid_attributes.merge(:user_id => @user), :user_id => @user}, valid_session
        response.should redirect_to( user_klus_url(:user_id => @user) )
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved klu as @klu" do
        # Trigger the behavior that occurs when invalid params are submitted
        Klu.any_instance.stub(:save).and_return(false)
        post :create, {:klu => {}, :user_id => @user}, valid_session
        assigns(:klu).should be_a_new(Klu)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Klu.any_instance.stub(:save).and_return(false)
        post :create, {:klu => {}, :user_id => @user}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested users klu" do
        klu = FactoryGirl.create(:published_kluuu)
        # Assuming there are no other klus in the database, this
        # specifies that the Klu created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Klu.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:user_id => klu.user, :id => klu.to_param, :klu => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested users klu as @klu" do
        klu = FactoryGirl.create(:published_kluuu)
        put :update, {:id => klu.to_param, :klu => valid_attributes, :user_id => klu.user.id}, valid_session
        assigns(:klu).should eq(klu)
      end

      it "redirects to the users klu" do
        klu = FactoryGirl.create(:published_kluuu)
        put :update, {:id => klu.to_param, :klu => valid_attributes, :user_id => klu.user}, valid_session
        response.should redirect_to(user_klu_url(:user_id => klu.user, :id => klu))
      end
    end

    describe "with invalid params" do
      it "assigns the users klu as @klu" do
        klu = FactoryGirl.create(:published_kluuu)
        # Trigger the behavior that occurs when invalid params are submitted
        Klu.any_instance.stub(:save).and_return(false)
        put :update, {:user_id => klu.user, :id => klu.to_param, :klu => {}}, valid_session
        assigns(:klu).should eq(klu)
      end

      it "re-renders the 'edit' template" do
        klu = FactoryGirl.create(:published_kluuu)
        # Trigger the behavior that occurs when invalid params are submitted
        Klu.any_instance.stub(:save).and_return(false)
        put :update, {:user_id => klu.user, :id => klu.to_param, :klu => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested klu" do
      klu = FactoryGirl.create(:published_kluuu)
      expect {
        delete :destroy, {:id => klu.to_param, :user_id => klu.user.id }, valid_session
      }.to change(Klu, :count).by(-1)
    end

    it "redirects to users profile" do
      klu = FactoryGirl.create(:published_kluuu)
      delete :destroy, {:id => klu.to_param, :user_id => klu.user.id}, valid_session
      response.should redirect_to(user_url(:id => klu.user))
    end
  end

end

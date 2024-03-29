require 'spec_helper'

describe CategoriesController do

  let(:valid_attributes) { { "name" => "MyString" } }
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all categories as @categories" do
      category = Category.create! valid_attributes
      get :index, {}, valid_session
      assigns(:categories).should eq([category])
    end
  end

  describe "GET new" do
    it "assigns a new category as @category" do
      get :new, {}, valid_session
      assigns(:category).should be_a_new(Category)
    end
  end

  describe "GET edit" do
    it "assigns the requested category as @category" do
      category = Category.create! valid_attributes
      get :edit, {:id => category.to_param}, valid_session
      assigns(:category).should eq(category)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Category" do
        expect {
          post :create, {:category => valid_attributes}, valid_session
        }.to change(Category, :count).by(1)
      end

      it "assigns a newly created category as @category" do
        post :create, {:category => valid_attributes}, valid_session
        assigns(:category).should be_a(Category)
        assigns(:category).should be_persisted
      end

      it "redirects to the created category" do
        post :create, {:category => valid_attributes}, valid_session
        response.should redirect_to(categories_path)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved category as @category" do
        # Trigger the behavior that occurs when invalid params are submitted
        Category.any_instance.stub(:save).and_return(false)
        post :create, {:category => { "name" => "invalid value" }}, valid_session
        assigns(:category).should be_a_new(Category)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Category.any_instance.stub(:save).and_return(false)
        post :create, {:category => { "name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested category" do
        category = Category.create! valid_attributes
        Category.any_instance.should_receive(:update).with({ "name" => "MyString" })
        put :update, {:id => category.to_param, :category => { "name" => "MyString" }}, valid_session
      end

      it "assigns the requested category as @category" do
        category = Category.create! valid_attributes
        put :update, {:id => category.to_param, :category => valid_attributes}, valid_session
        assigns(:category).should eq(category)
      end

      it "redirects to the category" do
        category = Category.create! valid_attributes
        put :update, {:id => category.to_param, :category => valid_attributes}, valid_session
        response.should redirect_to(categories_path)
      end
    end

    describe "with invalid params" do
      it "assigns the category as @category" do
        category = Category.create! valid_attributes
        Category.any_instance.stub(:save).and_return(false)
        put :update, {:id => category.to_param, :category => { "name" => "invalid value" }}, valid_session
        assigns(:category).should eq(category)
      end

      it "re-renders the 'edit' template" do
        category = Category.create! valid_attributes
        Category.any_instance.stub(:save).and_return(false)
        put :update, {:id => category.to_param, :category => { "name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested category" do
      category = Category.create! valid_attributes
      expect {
        delete :destroy, {:id => category.to_param}, valid_session
      }.to change(Category, :count).by(-1)
    end

    it "redirects to the categories list" do
      category = Category.create! valid_attributes
      delete :destroy, {:id => category.to_param}, valid_session
      response.should redirect_to(categories_url)
    end
  end

end

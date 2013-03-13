require "spec_helper"

describe BmailsController do
  describe "routing" do

    it "routes to #index" do
      get("/bmails").should route_to("bmails#index")
    end

    it "routes to #new" do
      get("/bmails/new").should route_to("bmails#new")
    end

    it "routes to #show" do
      get("/bmails/1").should route_to("bmails#show", :id => "1")
    end

    it "routes to #edit" do
      get("/bmails/1/edit").should route_to("bmails#edit", :id => "1")
    end

    it "routes to #create" do
      post("/bmails").should route_to("bmails#create")
    end

    it "routes to #update" do
      put("/bmails/1").should route_to("bmails#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/bmails/1").should route_to("bmails#destroy", :id => "1")
    end

  end
end

require "rails_helper"

RSpec.describe ProjectsController, type: :controller do
    context "GET #index" do
      it "returns a success response" do
        get :index
        expect(response).to have_http_status(200)
      end
    end
  
    context "GET #show" do
      let!(:project) { Project.create(title: "Test title", description: "Test description", details: "Test details") }
      it "return status 200" do
        get :show, params: { id: project }
        expect(response).to have_http_status(200)
      end
    end
  end
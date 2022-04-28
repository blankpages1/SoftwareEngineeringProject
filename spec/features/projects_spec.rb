require 'rails_helper'

RSpec.feature "Projects", type: :feature do
  context "Create new project" do
    before(:each) do
      user = User.create!(:email => 'test@example.com', :password => 'f4k3p455w0rd')
      login_as(user, :scope => :user)
      visit new_project_path
      within(all("form")[1]) do
        fill_in "Title", with: "Test title"
        fill_in "Details", with: "Test details"
      end
    end

    scenario "should be successful" do
      fill_in "Description", with: "Test description"
      click_button "Create Project"
      expect(page).to have_content("Project was successfully created")
    end

    scenario "should fail" do
      click_button "Create Project"
      expect(page).to have_content("Description can't be blank")
    end
  end

  context "Create new project 2" do
    scenario "cannot create without account" do
      visit new_project_path
      expect(page).to have_content("sign up before cont")
    end
  end

  context "Update project" do
    let(:project) { Project.create(title: "Test title", description: "Test content", details: "test details") }
    before(:each) do
      user = User.create!(:email => 'test@example.com', :password => 'f4k3p455w0rd')
      login_as(user, :scope => :user)
      visit edit_project_path(project)
    end

    scenario "should be successful" do
      within(all("form")[1]) do
        fill_in "Description", with: "New description content"
      end
      click_button "Update Project"
      expect(page).to have_content("Project was successfully updated")
    end

    scenario "should fail" do
      within(all("form")[1]) do
        fill_in "Description", with: ""
      end
      click_button "Update Project"
      expect(page).to have_content("Description can't be blank")
    end
  end

  context "Update project 2" do
    let(:project) { Project.create(title: "Test title", description: "Test content", details: "test details") }

    scenario "should be successful" do
      visit edit_project_path(project)
      expect(page).to have_content("sign up before cont")
    end

  end

  context "Remove existing project" do
    let!(:project) { Project.create(title: "Test title", description: "Test content", details: "Test details") }
    scenario "remove project" do
      user = User.create!(:email => 'test@example.com', :password => 'f4k3p455w0rd')
      login_as(user, :scope => :user)
      visit project_path(project)
      click_button "Destroy this project"
      expect(page).to have_content("Project was successfully destroyed")
      expect(Project.count).to eq(0)
    end

    scenario "cannot remove project without login" do
      visit project_path(project)
      expect(page).to have_no_content("Destroy this project")
    end
  end
end

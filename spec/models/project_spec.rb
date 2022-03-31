require "rails_helper"

RSpec.describe Project, type: :model do
    context "Validation tests" do
        it "ensures the title is present" do
            project = Project.new(description: "Content of the description", details: "test")
            expect(project.valid?).to eq(false)
        end

        it "ensures the description is present" do
            project = Project.new(title: "Content of the title", details: "test")
            expect(project.valid?).to eq(false)
        end

        it "ensures the details list is present" do
            project = Project.new(title: "Content of the title", description: "test")
            expect(project.valid?).to eq(false)
        end

        it "should be able to save" do
            project = Project.new(title: "title", description: "Content of the description", details: "Test details")
            expect(project.save).to eq(true)
        end
    
    end

    context "scope tests" do
        let(:params) {{title: "title", description: "description", details: "Test details"}}
        before(:each) do
            Project.create(params)
            Project.create(params)
            Project.create(params)
            Project.create(params)
        end

        it "should return all projects" do
            expect(Project.count).to eq(4)
        end
        
    end

end
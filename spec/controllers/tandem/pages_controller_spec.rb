module Tandem

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

  describe Tandem::PagesController do
    # This should return the minimal set of attributes required to create a valid
    # Page. As you add validations to Page, be sure to
    # update the return value of this method accordingly.
    def valid_attributes
      @valid_attributes ||= Factory.attributes_for(:tandem_page)
    end

    describe "GET index" do
      it "assigns all pages as @pages" do
        page = Factory(:tandem_page)
        get :index
        assigns(:pages).should eq([page])
      end
    end

    describe "GET show" do
      it "assigns the requested page as @page" do
        page = Factory(:tandem_page)
        get :show, :id => page.to_param
        assigns(:page).should eq(page)
      end

      context "page without a custom layout set" do
        let(:page) { Factory(:tandem_page) }
        subject { get :show, :id => page.to_param }

        it { should render_template("layouts/application") }
      end

      context "page with a custom layout" do
        let(:page) { Factory(:tandem_page, :layout => 'custom_layout') }
        subject { get :show, :id => page.to_param }

        it { should render_template("layouts/custom_layout") }
      end

      context "page without a custom template set" do
        let(:page) { Factory(:tandem_page) }
        subject { get :show, :id => page.to_param }

        it { should render_template("tandem/pages/show") }
      end

      context "page with a custom template" do
        let(:page) { Factory(:tandem_page, :template => 'custom_template') }
        subject { get :show, :id => page.to_param }

        it { should render_template("tandem/pages/custom_template") }
      end
    end

    describe "GET home" do
      context "when the user can only read Page" do
        before(:each) do
          ability = Object.new
          ability.extend(CanCan::Ability)
          ability.can :read, Page
          controller.stub(:current_ability) { ability }
        end
        
        subject { get :home }

        it { should render_template("tandem/pages/show") }
        its(:code) { should == '200' }
      end

      context "page without a custom template set" do
        before(:each) { Factory(:tandem_page, is_default: true) }
        subject { get :home }

        it { should render_template("tandem/pages/show") }
      end

      context "page with a custom template" do
        before(:each) { Factory(:tandem_page, template: 'custom_template', is_default: true) }
        subject { get :home }

        it { should render_template("tandem/pages/custom_template") }
      end

      context "when there are no pages in the database" do
        it "should create a page" do
          lambda { get :home }.should change(Page, :count).by(1)
        end

        it "should create a page marked as default" do
          get :home
          Page.where(is_default: true).first.should be_a(Page)
        end
      end

    end

    describe "GET new" do
      it "assigns a new page as @page" do
        get :new
        assigns(:page).should be_a_new(Page)
      end
    end

    describe "GET edit" do
      it "assigns the requested page as @page" do
        page = Factory(:tandem_page)
        get :edit, :id => page.to_param
        assigns(:page).should eq(page)
      end
    end

    describe "POST create" do
      describe "with valid params" do
        it "creates a new Page" do
          expect {
            post :create, :page => valid_attributes
          }.to change(Page, :count).by(1)
        end

        it "assigns a newly created page as @page" do
          post :create, :page => valid_attributes
          assigns(:page).should be_a(Page)
          assigns(:page).should be_persisted
        end

        it "should redirect to the page" do
          post :create, :page => valid_attributes
          response.should redirect_to("/tandem/pages/#{valid_attributes[:slug]}")
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved page as @page" do
          # Trigger the behavior that occurs when invalid params are submitted
          Page.any_instance.stub(:save).and_return(false)
          post :create, :page => {}
          assigns(:page).should be_a_new(Page)
        end

        it "re-renders the 'new' template" do
          # Trigger the behavior that occurs when invalid params are submitted
          Page.any_instance.stub(:save).and_return(false)
          post :create, :page => {}
          response.should render_template("new")
        end
      end
    end

    describe "PUT update" do
      describe "with valid params" do
        it "updates the requested page" do
          page = Factory(:tandem_page)
          # Assuming there are no other pages in the database, this
          # specifies that the Page created on the previous line
          # receives the :update_attributes message with whatever params are
          # submitted in the request.
          Page.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
          put :update, :id => page.to_param, :page => {'these' => 'params'}
        end

        it "assigns the requested page as @page" do
          page = Factory(:tandem_page)
          put :update, :id => page.to_param, :page => valid_attributes
          assigns(:page).should eq(page)
        end

        it "should redirect to the page" do
          page = Factory(:tandem_page)
          put :update, :id => page.to_param, :page => valid_attributes
          response.should redirect_to("/tandem/pages/#{valid_attributes[:slug]}")
        end
      end

      describe "with invalid params" do
        it "assigns the page as @page" do
          page = Factory(:tandem_page)
          # Trigger the behavior that occurs when invalid params are submitted
          Page.any_instance.stub(:save).and_return(false)
          put :update, :id => page.to_param, :page => {}
          assigns(:page).should eq(page)
        end

        it "re-renders the 'edit' template" do
          page = Factory(:tandem_page)
          # Trigger the behavior that occurs when invalid params are submitted
          Page.any_instance.stub(:save).and_return(false)
          put :update, :id => page.to_param, :page => {}
          response.should render_template("edit")
        end
      end
    end

    describe "DELETE destroy" do
      it "destroys the requested page" do
        page = Factory(:tandem_page)
        expect {
          delete :destroy, :id => page.to_param
        }.to change(Page, :count).by(-1)
      end

      it "redirects to the pages list" do
        page = Factory(:tandem_page)
        delete :destroy, :id => page.to_param
        response.should redirect_to(pages_path)
      end
    end
  end
end

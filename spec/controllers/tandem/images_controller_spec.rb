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

  describe ImagesController do
    before(:each) do
      controller.append_view_path(File.join(ENGINE_RAILS_ROOT,'/lib/generators/templates'))
    end

    # This should return the minimal set of attributes required to create a valid
    # Image. As you add validations to Image, be sure to
    # update the return value of this method accordingly.
    def valid_attributes
      attrs = Factory.attributes_for(:tandem_image)
      attrs[:resource] = Rack::Test::UploadedFile.new(ENGINE_RAILS_ROOT + 'spec/fixtures/tandem/images/test.jpg', 'image/jpeg')
      attrs
    end

    describe "GET index" do
      it "assigns all images as @images" do
        image = Factory(:tandem_image)
        get :index
        assigns(:images).should eq([image])
      end
    end

    describe "GET show" do
      it "assigns the requested image as @image" do
        image = Factory(:tandem_image)
        get :show, :id => image.id
        assigns(:image).should eq(image)
      end
    end

    describe "GET new" do
      it "assigns a new image as @image" do
        get :new
        assigns(:image).should be_a_new(Image)
      end
    end

    describe "GET edit" do
      it "assigns the requested image as @image" do
        image = Factory(:tandem_image)
        get :edit, :id => image.id
        assigns(:image).should eq(image)
      end
    end

    describe "POST create" do
      describe "with valid params" do
        it "creates a new Image" do
          expect {
            post :create, :image => valid_attributes
         }.to change(Image, :count).by(1)
        end

        it "assigns a newly created image as @image" do
          post :create, :image => valid_attributes
          assigns(:image).should be_a(Image)
          assigns(:image).should be_persisted
        end

        it "redirects to the created image" do
          post :create, :image => valid_attributes
          response.should redirect_to(new_image_path(update_gallery: true))
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved image as @image" do
          # Trigger the behavior that occurs when invalid params are submitted
          Image.any_instance.stub(:save).and_return(false)
          post :create, :image => {}
          assigns(:image).should be_a_new(Image)
        end

        it "re-renders the 'new' template" do
          # Trigger the behavior that occurs when invalid params are submitted
          Image.any_instance.stub(:save).and_return(false)
          post :create, :image => {}
          response.should render_template("new")
        end
      end
    end

    describe "PUT update" do
      describe "with valid params" do
        it "updates the requested image" do
          image = Factory(:tandem_image)
          # Assuming there are no other images in the database, this
          # specifies that the Image created on the previous line
          # receives the :update_attributes message with whatever params are
          # submitted in the request.
          Image.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
          put :update, :id => image.id, :image => {'these' => 'params'}
        end

        it "assigns the requested image as @image" do
          image = Factory(:tandem_image)
          put :update, :id => image.id, :image => valid_attributes
          assigns(:image).should eq(image)
        end

        it "redirects to the image" do
          image = Factory(:tandem_image)
          put :update, :id => image.id, :image => valid_attributes
          response.should redirect_to(image)
        end
      end

      describe "with invalid params" do
        it "assigns the image as @image" do
          image = Factory(:tandem_image)
          # Trigger the behavior that occurs when invalid params are submitted
          Image.any_instance.stub(:save).and_return(false)
          put :update, :id => image.id, :image => {}
          assigns(:image).should eq(image)
        end

        it "re-renders the 'edit' template" do
          image = Factory(:tandem_image)
          # Trigger the behavior that occurs when invalid params are submitted
          Image.any_instance.stub(:save).and_return(false)
          put :update, :id => image.id, :image => {}
          response.should render_template("edit")
        end
      end
    end

    describe "DELETE destroy" do
      it "destroys the requested image" do
        image = Factory(:tandem_image)
        expect {
          delete :destroy, :id => image.id
        }.to change(Image, :count).by(-1)
      end

      it "redirects to the images list" do
        image = Factory(:tandem_image)
        delete :destroy, :id => image.id
        response.should redirect_to(images_path(update_current_image: true))
      end
    end

  end
end
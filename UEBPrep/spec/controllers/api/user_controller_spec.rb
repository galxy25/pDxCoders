require 'rails_helper'

RSpec.describe Api::UsersController, type: :controller do

    context "with two users" do
      let!(:user) {FactoryGirl.create(:user)}
      let!(:user2) {FactoryGirl.create(:user, :email => "some@some.com")}

      describe "#index" do
        before(:each) do
          get :index
          @results = JSON.parse(response.body)
        end

        it "returns status 200" do
          expect(@results["status"]).to be 200
        end

        it "returns all users" do
          expect(@results["users"].count).to be 2
        end
      end

      describe "#show" do
        before(:each) do
          get :show , :id => user2.id
          @results = JSON.parse(response.body)
        end

        it "returns status 200 for a valid user" do
          expect(@results["status"]).to be 200
        end

        it "returns the user when given an existing user id" do
          expect(@results["user"]["email"]).to match user2.email
          expect(@results["user"]["password"]).to match user2.password
        end

        it "raises an error when asked for non-existent user" do
          begin
            get :show, :id => 42
          rescue => error
            expect(error.class).to be ActiveRecord::RecordNotFound
          end
        end
      end

      describe "#create" do
        before(:each) do
          @num_users_previous = User.all.count
        end
        it "creates a new user when given valid user data" do
          post :create, user: { email: "test@test.com",
                                password: "password" }
          results = JSON.parse(response.body)

          expect(results["status"]).to be 204
          expect(results["user"]["email"]).to match "test@test.com"
          expect(results["user"]["password"]).to match "password"
          expect(User.all.count).to equal(@num_users_previous + 1)
        end

        it "returns 500 when given invalid user data" do
          post :create, user: { email: "testtest.com",
                                password: "password" }
          results = JSON.parse(response.body)

          expect(results["status"]).to be 500
          expect(User.all.count).to equal(@num_users_previous)
        end
      end
    end

end
require 'rails_helper'

RSpec.describe TodosController, type: :request do
  let(:users) { FactoryBot.create_list(:user, 3) }
  let!(:todo) { FactoryBot.create(:todo) }

  before do
    @header = { Authorization: "bearer " + token_generator }
  end

  # =======================todos#index=======================
 describe 'GET /todos' do
  let!(:todo1) { FactoryBot.create(:todo) }
  let!(:todo2) { FactoryBot.create(:todo, user_ids: users.pluck(:id)) }
    describe 'unauthorized' do
      it "should return unauthorized" do
        get '/todos'
        assert_response :unauthorized
      end
    end

    describe 'authorized' do
      context 'Successful' do
        it 'returns all todos' do
          get '/todos', headers: @header
          expect(response.status).to eq 200
        end
      end
    end
  end

  # =======================todos#personal list=======================
 describe 'GET /todos' do
  let!(:todo1) { FactoryBot.create(:todo) }
  let!(:todo2) { FactoryBot.create(:todo) }
    describe 'unauthorized' do
      it "should return unauthorized" do
        get '/todos'
        assert_response :unauthorized
      end
    end

    describe 'authorized' do
      context 'Successful' do
        it 'returns all todos' do
          get '/todos', headers: @header
          expect(response.status).to eq 200
        end
      end
    end
  end


  # =======================todos#collaborative list=======================
 describe 'GET /todos' do
  let!(:todo1) { FactoryBot.create(:todo) }
  let!(:todo2) { FactoryBot.create(:todo, user_ids: users.pluck(:id)) }
    describe 'unauthorized' do
      it "should return unauthorized" do
        get '/todos'
        assert_response :unauthorized
      end
    end

    describe 'authorized' do
      context 'Successful' do
        it 'returns all todos' do
          get '/todos', headers: @header
          expect(response.status).to eq 200
        end
      end
    end
  end


  # =======================todos#show=======================
  describe 'GET /todos/:id' do
    describe 'unauthorized' do
      it "should return unauthorized" do
        get "/todos/#{todo.id}"
        assert_response :unauthorized
      end
    end

    describe 'authorized' do
      context 'Successful' do
        it 'returns particular todo with associated title' do
          get "/todos/#{todo.id}", headers: @header
          expect(response.status).to eq 200
        end
      end
    end
  end

  # =======================todos#create=======================
  
  describe 'todo /todos' do
    describe 'unauthorized' do
      it "should return unauthorized" do
        process(:post, "/todos", params: { todo: {title: "test", description: "This is test description"} })
        assert_response :unauthorized
      end
    end

    describe 'authorized' do
      context 'Successful' do
        it 'creates a successful message todo' do
          process(:post, "/todos", params: { todo: {title: "test", description: "This is test description"} }, headers: @header)
          expect(response.status).to eq 201
        end
      end
    end
  end

  # =======================todos#update=======================
 
  describe 'PUT /todos/:id' do
    describe 'unauthorized' do
      it "should return unauthorized" do
        process(:put, "/todos/#{todo.id}", params: { todo: {title: "test1", description: "This is test description"} })
        assert_response :unauthorized
      end
    end

    describe 'authorized' do
      context 'Successful' do
        it 'creates a successful message todo' do
          process(:put, "/todos/#{todo.id}", params: { todo: {title: "test1", description: "This is test description"} }, headers: @header)
        end
      end
    end
  end

  # =======================todo#delete=======================
  describe 'DELETE /todos/:id' do
    describe 'unauthorized' do
      it "should return unauthorized" do
        delete "/todos/#{todo.id}"
        assert_response :unauthorized
      end
    end

    describe 'authorized' do
      context 'Successful' do
        it 'delete the todo' do
          delete "/todos/#{todo.id}", headers: @header
          expect(response.status).to eq 200
        end
      end
    end
  end
end

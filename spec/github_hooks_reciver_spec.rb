require "spec_helper"
require "rack/test"
require "github/hooks"

def app
  Github::Hooks::Server.new
end

describe 'Github::Hools::Reciver' do
  include Rack::Test::Methods

  describe 'GET' do
    it '400 BAD REQUEST' do
      get '/'
      expect(last_response.status).to eq(400)
      expect(last_response.body).to   eq('BAD REQUEST')
    end
  end

  describe 'POST' do
    describe 'lack request params' do
      it '400 BAD REQUEST' do
        post '/'
        expect(last_response.status).to  eq(400)
        expect(last_response.body).to  eq('BAD REQUEST')
      end
    end

    describe 'have payload params' do
      describe 'X-GitHub-Event is nil' do
        it '200 OK' do
          post '/', {payload: {hoge: "fuga"}}
          expect(last_response.status).to eq(200)
          expect(last_response.body).to eq("OK")
        end
      end

      describe 'X-Github-Event is hoge' do
        it '200 OK' do
          post '/', {payload: {hoge: 'fuga'}}, {"X-Github-Event" => 'hoge'}
          expect(last_response.status).to eq(200)
          expect(last_response.body).to eq("OK")
        end
      end
    end
  end
end

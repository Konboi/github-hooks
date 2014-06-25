require "spec_helper"
require "rack/test"
require "github/hooks"


$counter      = 0
$pull_request = ''

def push
  $counter = $counter + 1
end

def p_r(msg = '')
  $pull_request = msg
end


describe 'Github::Hooks' do
  include Rack::Test::Methods

  def app
    hooks = Github::Hooks.set do |hook|
      hook.on_push do |request|
        push
      end

      hook.on_pull_request do |request|
        p_r(request["payload"]["hoge"])
      end
    end
    hooks.server
  end

  context 'X-Github-Event is push' do
    it '$counter increment' do
      expect($counter).to eq(0)
      post '/', {payload: {hoge: 'fuga'}}, {"X-Github-Event" => 'push'}
      expect(last_response.status).to eq(200)
      expect(last_response.body).to eq("OK")
      expect($counter).to eq(1)
    end
  end

  context 'X-GitHub-Event is pull-request' do
    it 'update pull_request' do
      expect($pull_request).to eq('')
      post '/', {payload: {hoge: 'fuga'}}, {"X-Github-Event" => 'pull_request'}
      expect(last_response.status).to eq(200)
      expect(last_response.body).to eq("OK")
      expect($pull_request).to eq('fuga')
    end
  end
end


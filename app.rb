require 'sinatra'
require 'sinatra/base'
require 'sinatra/param'
require 'sinatra/json'
require 'mongoid'
require 'dotenv'
require 'sinatra-initializers'
require 'carrierwave/mongoid'
require 'active_model_serializers'
require 'mini_magick'
require './uploaders/image_uploader'
require './models/task'
require 'require_all'

require_all 'serializers'

Dotenv.load

class App < Sinatra::Application
  register Sinatra::Initializers
  configure do
    set :raise_sinatra_param_exceptions, true
    set show_exceptions: false
    set :public_folder, 'uploads'
  end

  post '/imgload' do      
    param :image,  String, in: ['resize'],  required: true
    param :task,   String, required: true
    param :params, String, required: true

    taskobj = Factory.getInst.getObject params
    task = taskobj.processed params

    json task
  end

  get 'get_task/:id' do
    param :id, String, required: true
    result = Task.find params['id']

    json result
  end
    
  error Mongoid::Errors::DocumentNotFound do
    status 404
    { error: "Not found" }.to_s
  end
end

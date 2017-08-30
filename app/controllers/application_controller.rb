require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do

  end

  get '/posts/new' do

    erb :new
  end

  get '/posts/:id/edit' do
    @post = Post.find(params[:id])

    erb :edit
  end

  get '/posts/:id' do
    @post = Post.find(params[:id])

    erb :show

  end

  patch '/posts/:id' do
   post = Post.find(params[:id])
  post.update(name: params[:name], content: params[:content])

   redirect "/posts/#{post.id}"

  end

  post '/posts' do

    post = Post.create(params[:post])

    redirect '/posts'
  end

  get '/posts' do

      @posts = Post.all

      erb :index
  end

  delete '/posts/:id/delete' do

   post = Post.find(params[:id])
   @post_name = post.name

   post.delete

   erb :delete
 end


  # should this go at the bottom


end

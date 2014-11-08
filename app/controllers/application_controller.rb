class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def hello_world 
    greet = ['hey', 
             'yo', 
             'hello', 
             'hola', 
             'hello'].sample.capitalize 
    render :text => "#{greet}, World!" 
  end 
end

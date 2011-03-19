class SessionsController < ApplicationController

  skip_before_filter :authenticate, :only => [:new, :create]

  def new;end

  def create
    if user = User.authenticate(params[:email], params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Logged In"
      redirect_to root_url
    else
      flash[:error] = "Email or Passowrd incorrect!"
      render :action => :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged Out"
  end

end


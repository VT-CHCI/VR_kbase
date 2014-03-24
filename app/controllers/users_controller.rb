class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @users = User.all
    
    respond_to do |format|
      if !current_user.admin
        format.html { redirect_to '/', :notice => 'You are not an admin.' }
        format.json { render :json => @users, :status => :unprocessable_entity }
      else
        format.html # index.html.erb
        format.json { render :json => @users }
      end
    end
  end

  def edit
    @user = User.find(params[:id])
    
    respond_to do |format|
      if !current_user.admin
        format.html { redirect_to @user, :notice => 'You are not an admin.' }
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
      else
        format.html # index.html.erb
        format.json { render :json => @user }
      end
    end
  end

  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user]) and current_user.admin
        puts @user.errors
        format.html { redirect_to '/users', :notice => 'User updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  def show
    @user = User.find(params[:id])

    respond_to do |format|
      if !current_user.admin and current_user != @user
        format.html { redirect_to '/', :notice => 'You are not an admin.' }
        format.json { render :json => @user, :status => :unprocessable_entity }
      else
        format.html # index.html.erb
        format.json { render :json => @user }
      end
    end
  end

end

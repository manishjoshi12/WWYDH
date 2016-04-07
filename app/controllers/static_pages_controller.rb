class StaticPagesController < ApplicationController
  skip_before_action :ensure_login, only: [:home, :about, :contact, :register, :search]

  respond_to :js

  def home
  end

  def search
  end

  def about
  end

  def contact
  end

  #def register
  #end

  def login
  end

  def profile
  end

  def editprofile
  end
end

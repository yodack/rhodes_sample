require 'rho/rhocontroller'
require 'helpers/browser_helper'

class BCardController < Rho::RhoController
  include BrowserHelper

  # GET /BCard
  def index
    @bcards = BCard.find(:all)
    render :back => '/app'
  end

  # GET /BCard/{1}
  def show
    @bcard = BCard.find(@params['id'])
    if @bcard
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /BCard/new
  def new
    @bcard = BCard.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /BCard/{1}/edit
  def edit
    @bcard = BCard.find(@params['id'])
    if @bcard
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /BCard/create
  def create
    @bcard = BCard.create(@params['bcard'])
    redirect :action => :index
  end

  # POST /BCard/{1}/update
  def update
    @bcard = BCard.find(@params['id'])
    @bcard.update_attributes(@params['bcard']) if @bcard
    redirect :action => :index
  end

  # POST /BCard/{1}/delete
  def delete
    @bcard = BCard.find(@params['id'])
    @bcard.destroy if @bcard
    redirect :action => :index  
  end
end

class App::UpdatesController < ApplicationController

  before_action :authenticate_admin!, except: [:index, :show]
  before_action :set_app_update, only: %i[ show edit update destroy ]

  # GET /app/updates or /app/updates.json
  def index
    @app_updates = App::Update.all.reverse
  end

  # GET /app/updates/1 or /app/updates/1.json
  def show
  end

  # GET /app/updates/new
  def new
    @app_update = App::Update.new
  end

  # GET /app/updates/1/edit
  def edit
  end

  # POST /app/updates or /app/updates.json
  def create
    @app_update = App::Update.new(app_update_params)

    if @app_update.save
      flash[:success] = t('views.app.general.flash.create', model: App::Update.model_name.human)
      redirect_to app_update_url(@app_update)
    else
      render :new, status: :unprocessable_entity 
    end
  end

  # PATCH/PUT /app/updates/1 or /app/updates/1.json
  def update
    if @app_update.update(app_update_params)
      flash[:success] = t('views.app.general.flash.update', model: App::Update.model_name.human)
      redirect_to app_update_url(@app_update)
    else
      render :edit, status: :unprocessable_entity 
    end
  end

  # DELETE /app/updates/1 or /app/updates/1.json
  def destroy
    @app_update.destroy
    flash[:success] = t('views.app.general.flash.destroy', model: App::Update.model_name.human)
    redirect_to app_updates_url
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_app_update
    @app_update = App::Update.find(params[:id])
  end

  def app_update_params
    permitted_params = params.require(:app_update).permit(:version, :release_date, :description, :added_features, :removed_features, :bugs_fixed)
  end
  
end

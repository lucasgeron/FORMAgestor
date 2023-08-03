class App::ArticlesController < ApplicationController
  before_action :set_app_article, only: %i[ show edit update destroy ]
  
  layout 'public_application'
  # GET /app/articles or /app/articles.json
  def index
    # @app_articles = App::Article.all
    @pagy, @articles = pagy(App::Article.all, items: 3)

    respond_to do |format|
      format.html 
      format.turbo_stream
    end
   
  end

  # GET /app/articles/1 or /app/articles/1.json
  def show
  end

  # GET /app/articles/new
  def new
    @app_article = App::Article.new
  end

  # GET /app/articles/1/edit
  def edit
  end

  # POST /app/articles or /app/articles.json
  def create
    @app_article = App::Article.new(app_article_params)

    respond_to do |format|
      if @app_article.save
        format.html { redirect_to app_article_url(@app_article), notice: "Article was successfully created." }
        format.json { render :show, status: :created, location: @app_article }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @app_article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /app/articles/1 or /app/articles/1.json
  def update
    respond_to do |format|
      if @app_article.update(app_article_params)
        format.html { redirect_to app_article_url(@app_article), notice: "Article was successfully updated." }
        format.json { render :show, status: :ok, location: @app_article }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @app_article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /app/articles/1 or /app/articles/1.json
  def destroy
    @app_article.destroy

    respond_to do |format|
      format.html { redirect_to app_articles_url, notice: "Article was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_app_article
      @app_article = App::Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def app_article_params
      params.require(:app_article).permit(:title, :cover_url, :body)
    end
end

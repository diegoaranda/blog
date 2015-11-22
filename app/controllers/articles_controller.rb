class ArticlesController < ApplicationController
	
	before_action :authenticate_user!, except: [:show,:index]
	before_action :set_article, except: [:index,:new,:create]
	#before_action :validate_user, except: [:show, :index]
	#Get /articles
	def index
		@articles = Article.all #Obtiene todos los registros de la BD
	end
	
	#GET /articles/id
	def show
		#@article = Article.find(params[:id]) #Encontrar por un id
		@article.update_visits_count
		@comment = Comment.new
	end
	
	#GET articles/new
	def new
		@article = Article.new
	end
	
	#POST articles
	def create
		@article = current_user.articles.new(article_params)
		
		if @article.save
			redirect_to @article
		else
			render :new
		end
	end

	#DESTROY articles
	def destroy
		@article = Article.find(params[:id])
		@article.destroy #Elimina el objeto de la base de datos
		redirect_to articles_path
	end

	def edit
		
	end

	def update
		# @article = Article.find(params[:id])
		# if @article.update(article_params)
		# 	redirect_to @article
		# else
		# 	render :edit
		# end
	end

	private 

	def set_article
		@article = Article.find(params[:id])
	end

	def validate_user
		redirect_to new_user_session_path, notice: "Necesitas iniciar sesion"
	end

	def article_params
		params.require(:article).permit(:title,:body,:cover)
	end
end
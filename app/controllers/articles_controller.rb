class ArticlesController < ApplicationController
	
	#Get /articles
	def index
		@articles = Article.all #Obtiene todos los registros de la BD
	end
	
	#GET /articles/id
	def show
		@article = Article.find(params[:id]) #Encontrar por un id
	end
	
	#GET articles/new
	def new
		@article = Article.new
	end
	
	#POST articles
	def create
		@article = Article.new(title: params[:article][:title], body: params[:article][:body])
		
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
end
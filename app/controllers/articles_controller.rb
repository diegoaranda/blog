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
		@article = Article.new(article_params)
		
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
		@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])
		if @article.update(article_params)
			redirect_to @article
		else
			render :edit
		end
	end

	private 

	def article_params
		params.require(:article).permit(:title,:body)
	end
end
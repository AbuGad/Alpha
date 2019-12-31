class ArticlesController < ApplicationController

	def new
	 @article = Article.new
	end

	def create
		@article = Article.new(article_params)
		if @article.save
			flash[:noties] = "Article Was Successfully Created"
			redirect_to article_path(@article)
		else
		 render 'new'
		end
    end

    def show
    	@article = Article.find(params[:id])
    	
    end

    def edit
    	@article = Article.find(params[:id])
    	
    end

    def update
    	@article = Article.find(params[:id])
    	if @article.update (article_params)
    		flash[:notice] = "your article was Successfully updated"
    		redirect_to article_path(@article)
    	else
    		render 'edit'
    	end
    end

    def index
    	@articles = Article.all
    	
    end

    def destroy
    	@article = Article.find(params[:id])
    	@article.destroy
    	flash[:notice] = "article was Successfully deleted"
    	redirect_to articles_path
    	
    end

	private
    def article_params
		params.require(:article).permit(:title, :description)
	end
end

class ArticlesController < ApplicationController

	def new
	 @article = Article.new
	end

	def create
		@article = Article.new(article_params)
        @article.user = User.first
		if @article.save
			flash[:success] = "Article Was Successfully Created"
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
    		flash[:success] = "your article was Successfully updated"
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
    	flash[:danger] = "Article was Successfully Deleted"
    	redirect_to articles_path
    	
    end

	private
    def article_params
		params.require(:article).permit(:title, :description)
	end
end

class ArticlesController < ApplicationController
    def show
        @article = Article.find(params[:id])
    end

    def index
       @articles = Article.all 
    end

    #creating a new article

    def new

    end

    def create
        @article = Article.new(params.require(:article).permit(:title, :description))
        @article.save

        #redirect_to @article ; rails provides this shortcut to us.
        redirect_to article_path(@article)
    end

end
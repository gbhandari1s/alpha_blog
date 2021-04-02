class ArticlesController < ApplicationController
    def show
        @article = Article.find(params[:id])
    end

    def index
       @articles = Article.all 
    end

    #creating a new article

    def new

        @article = Article.new

    end

    def create
        @article = Article.new(params.require(:article).permit(:title, :description))
        if @article.save

            #redirect_to @article ; rails provides this shortcut to us.
            flash[:notice] = "Article was created successfully"
            redirect_to article_path(@article)
        else

            render 'new'

        end
    end

end
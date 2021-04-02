class ArticlesController < ApplicationController
    def show
        @article = Article.find(params[:id])
    end

    def index
       @articles = Article.all 
    end

    #creating a new article(new & create), edit an article (edit & update)

    def new

        @article = Article.new

    end

    def edit

        @article = Article.find(params[:id])

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

    def update
        @article = Article.find(params[:id])
        if @article.update(params.require(:article).permit(:title, :description))

            flash[:notice] = "Article was updated successfully"
            redirect_to article_path(@article)

        else

            render 'edit'

        end


    end

    #destroy the article

    def destroy

        @article = Article.find(params[:id])
        @article.destroy

        redirect_to articles_path

    end




end
class ArticlesController < ApplicationController

    #passing this method as a symbol to this helper for destroy, update,edit & show
    before_action :set_article, only: [:show, :edit, :update, :destroy]

    def show

    end

    def index
       @articles = Article.all 
    end

    #creating a new article(new & create), edit an article (edit & update)

    def new

        @article = Article.new

    end

    def edit


    end


    def create
        @article = Article.new(article_params)
        if @article.save

            #redirect_to @article ; rails provides this shortcut to us.
            flash[:notice] = "Article was created successfully"
            redirect_to article_path(@article)
        else

            render 'new'

        end
    end

    def update

        if @article.update(article_params)

            flash[:notice] = "Article was updated successfully"
            redirect_to article_path(@article)

        else

            render 'edit'

        end


    end

    #destroy the article

    def destroy

        @article.destroy

        redirect_to articles_path

    end

    private

    def set_article
        #used by destroy, update, edit, 
        @article = Article.find(params[:id])
    end

    def article_params
        #required for create and update actions; whitelisting the params passed from the web.
        params.require(:article).permit(:title, :description)
    end




end
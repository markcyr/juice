class ArticlesController < ApplicationController


  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_parms)

    if @article.save
      redirect_to article_url
    else
      render :new
    end
  end

  private


  def article_params
    params.require(:article).permit(:title, :image, :sentence, :text, :quote)
  end
end

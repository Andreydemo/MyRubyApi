class ArticlesController < ActionController::API
  before_action :find_article, only: [:show]

  def index
    @articles = Article.all
    render json: @articles
  end

  def show
    render json: @article
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      Publisher.publish("article", StateReplicaEvent.new(:create, @article.attributes))
      render json: @article
    end
  end

  def article_params
    params.require(:article).permit(:title, :body)
  end

  def find_article
    @article = Article.find(params[:id])
  end

end

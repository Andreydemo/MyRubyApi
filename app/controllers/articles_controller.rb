class ArticlesController < ActionController::API
  def index
    @article =  Article.find(1)

    if stale?(last_modified: @article.updated_at)
      render json: @article
    end
  end
end

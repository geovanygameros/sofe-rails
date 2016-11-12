class ArticlesController < ApplicationController

  http_basic_authenticate_with name: "admin", password: "admin", except: [:index, :show]

  def index
    @articles = Article.where("title LIKE ? OR text LIKE?" , "%#{params[:search]}%", "%#{params[:search]}%")
  end



  def new
  @article = Article.new
end
 
def create
  @article = Article.new(article_params)
 
  if @article.save
    redirect_to @article
  else
    render :new
  end
end

def update
  @article = Article.find(params[:id])
 
  if @article.update(article_params)
    redirect_to @article
  else
    render :edit
  end
end

	def edit
		@article = Article.find(params[:id])
	end	


	def show
		@article = Article.find(params[:id])
	end

def destroy
  @article = Article.find(params[:id])
  @article.destroy
  redirect_to articles_path
end

		private
		def article_params
			params.require(:article).permit(:title, :text, :search)
		end
		
end

class BlogsController < ApplicationController
  before_action :set_blog, only: %i[ show edit update destroy ]
  before_action :authenticate_user! #ブログ投稿や閲覧、編集、削除など）は、ログインしたユーザーのみに許可する
  before_action :set_q, only: [:index, :search]

  def index
    @q = Blog.ransack(params[:q])
    @blogs = @q.result.page(params[:page]).per(4)
    # @blogs = Blog.order(created_at: :desc)
  end

  def show
  end

  def new
    @blog = Blog.new
  end

  def edit
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      redirect_to @blog, notice: "ブログを投稿しました。"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @blog.update(blog_params)
      redirect_to @blog, notice: "ブログを更新しました。"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @blog.destroy
    redirect_to blogs_url, notice: "ブログを削除しました。"
  end

  def search
    @results = @q.result #ransackメソッドで取得したデータをActiveRecord_Relationのオブジェクトに変換するメソッド。
  end

  private
  def set_q
    @q = Blog.ransack(params[:q]) #検索フォームから送られるパラメーターを元に検索
    #ransackメソッドはwhereメソッドみたいなイメージ
  end

  def set_blog
    @blog = Blog.find(params[:id])
  end
  
  def blog_params
    params.require(:blog).permit(:title, :content)
  end
end

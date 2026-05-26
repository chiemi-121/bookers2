class SearchesController < ApplicationController
  before_action :authenticate_user! # ログインしている人だけ検索できる

  def search
    @model = params[:model] # ユーザーか投稿か
    @content = params[:content] # 検索ワード
    @method = params[:method] # 検索手法（完全一致など）

    if @model == 'user'
      @records = User.search_for(@content, @method)
    else
      @records = Book.search_for(@content, @method)
    end
    puts "検索対象モデル: #{@model}"
    puts "検索キーワード: #{@content}"
    puts "検索手法: #{@method}"
    puts "検索結果数: #{@records.count}"
  end
end
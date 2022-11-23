class Public::FavoritesController < ApplicationController
  before_action :authenticate_end_user!

  def index
    @sweets_revues = SweetsRevue.all.page(params[:page]).per(9).order(created_at: :desc)

    # タグ検索にチェックがついているかどうかを判断するためのフラグ
    # tag_is_selected = false

  #   if params[:tag_ids]
  #     @sweets_revues = []
  #     params[:tag_ids].each do |key, value|
  #       # 送られてきた[tag_ids]が１だったら（タグにチェックがついていたら）
  #       if value == "1"
  #         # tag_is_selectedをtrueにする
  #         tag_is_selected = true
  #         tag_sweets_revues = Tag.find_by(name: key).sweets_revues
  #         @sweets_revues = @sweets_revues.empty? ? tag_sweets_revues :  @sweets_revues & tag_sweets_revues
  #       end
  #     end
  #     # unlessはif文の逆。tag_is_selected = falseだったら、左側の記述を実行する。
  #     # tag_is_selected = false はタグにチェックがついていなかったとき
  #     @sweets_revues = SweetsRevue.all unless tag_is_selected
  #     ## ジャンルが選択されているときに処理を実行する
  #     # present? = 値があればtrue
  #     if params[:genre_id].present?
  #       @genre = Genre.find(params[:genre_id])
  #       @sweets_revues = @sweets_revues.where(genre_id: params[:genre_id])
  #     end
  #   end
  end

    def create
      sweets_revue = SweetsRevue.find(params[:sweets_revue_id])
      favorite = current_end_user.favorites.new(sweets_revue_id: sweets_revue.id)
      favorite.save
      redirect_to sweets_revue_path(sweets_revue)
    end

    def destroy
      sweets_revue = SweetsRevue.find(params[:sweets_revue_id])
      favorite = current_end_user.favorites.find_by(sweets_revue_id: sweets_revue.id)
      favorite.destroy
      redirect_to sweets_revue_path(sweets_revue)
    end

end
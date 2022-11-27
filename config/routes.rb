Rails.application.routes.draw do
## 会員用
# URL /customers/sign_in ...
  devise_for :end_users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

## 管理者用
# URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  devise_scope :end_user do
    ## ゲストログイン用
    post 'end_users/guest_sign_in',to: 'end_users/sessions#new_guest'
  end


## 会員側ルート設定
  scope module: :public do
    ## homes
    root "homes#top"
    ## sweets_revues
    resources :sweets_revues, except: [:destroy] do
      ## post_comments
      # sweets_revuesに対してコメントされるので親子関係になる
      # ネストしたURLを作成することでparams[:sweets_revue_id]でPostImageのidが取得できるようになる
      resources :post_comments, only: [:create, :destroy]
      ## favorites
      # resource : 単数形にすると、/:idがURLに含まれなくなります
      # 1人のユーザーは1つの投稿に対して1回しかいいねできない」という仕様の為idを含めなくても関連する他のモデルのidから特定できる
      resource :favorites, only: [:create, :destroy]
    end
    ## end_users
    get 'end_users/my_page' => 'end_users#mypage', as: 'mypage'
    # customers/editのようにするとdeviseのルーティングとかぶってしまうためinformationを付け加えている。
    get 'end_users/infomation/:id/edit' => 'end_users#edit', as: 'edit_infomation'
    # patch 'end_users/infomation/:id' => 'end_users#update', as: "update_end_user"
    patch 'end_users/information' => "end_users#update"
    # 退会確認画面
    get 'end_users/confirm'
    # 論理削除用のルーティング
    patch 'end_users/:id/withdraw' => 'end_users#withdraw', as: 'withdraw_end_user'
    resources :end_users, only: [:index, :show] do
      ##relationships
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    end

  end


 ##管理者側ルート設定
  namespace :admin do
    root "homes#top"
    resources :sweets_revues, only: [:show, :update, :index]
    patch 'sweets_revues/:id/stoppage' => 'sweets_revues#stoppage', as: 'stoppage_sweets_revue'
    resources :end_users, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :edit, :create, :update, :destroy]
    resources :tags, only: [:index, :edit, :create, :update, :destroy]
    # resources :searchs, only: [:index, :edit, :create, :update]

  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

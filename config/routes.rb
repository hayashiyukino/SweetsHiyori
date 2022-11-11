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


## 会員側ルート設定
  scope module: :public do
    # homes
    root "homes#top"
    get 'about' => 'homes#about'
#     # post_sweetses
#     resources :post_sweetses, except: [:destroy]
#     # end_users
    # get 'end_users/my_page' => 'end_users#show', as: 'mypage'
    # customers/editのようにするとdeviseのルーティングとかぶってしまうためinformationを付け加えている。
    # get 'end_users/infomation/:id/edit' => 'end_users#edit', as: 'edit_infomation'
    # patch 'end_users/infomation' => 'end_users#update'
    # get 'end_users/confirm' #=> 'end_users#confirm'
    # patch 'end_users/:id/withdraw' #=> 'end_users#withdraw', as: 'withdraw_customer'
    resources :end_users, only: [:index, :show]

#     # searches
#     # get "searches" => "searches#search"
    end


# ##管理者側ルート設定
#   namespace :admin do
#     get 'top' => 'homes#top', as: 'top'
#     resources :post_sweetse, only: [:show, :update]
#     resources :end_users, only: [:index, :show, :edit, :update]
#   end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

ActiveAdmin.register AdminUser do
  permit_params :email, :password, :password_confirmation

  index do
    column :email
    column :username
    column :photo_url
    column :header_photo
    column :friends_count
    column :tweets_count
    column :likes_give_it
    column :retweets_give_it
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end

ActiveAdmin.register Rent do
  permit_params :from, :to, :user_id, :book_id

  index do
    selectable_column
    id_column
    column :from
    column :to
    column :user_id
    column :book_id
    actions
  end

  filter :from
  filter :to
  filter :user_id
  filter :book_id
end

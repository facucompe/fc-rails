ActiveAdmin.register User do
  permit_params :first_name, :last_name, :email

  index do
    selectable_column
    id_column
    column :first_name
    column :last_name
    column :email
    actions
  end

  filter :first_name
  filter :last_name
  filter :email
end

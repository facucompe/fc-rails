ActiveAdmin.register Book do
permit_params :author, :genre, :image, :title, :publisher, :year

  index do
    selectable_column
    id_column
    column :author
    column :genre
    column :image
    column :title
    column :publisher
    column :year
    actions
  end

  filter :author
  filter :genre
  filter :image
  filter :title
  filter :publisher
  filter :year

end

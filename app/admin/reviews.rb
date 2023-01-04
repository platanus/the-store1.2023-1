ActiveAdmin.register Review do
  permit_params :user_id, :item_id, :body

  includes :user, :item

  index do
    selectable_column
    id_column
    column :item
    column :user
    column :body
    actions
  end

  form do |f|
    f.inputs do
      f.input :user, as: :select, display_name: 'display_name'
      f.input :item
      f.input :body
    end
    f.actions
  end
end

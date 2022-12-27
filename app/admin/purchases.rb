ActiveAdmin.register Purchase do
  permit_params :status, :delivery_company_id

  includes :item, :user, :delivery_company

  index do
    selectable_column
    id_column
    column :item
    column :user
    column :delivery_company
    tag_column :status
    actions
  end

  show do
    attributes_table do
      row :item
      row :user
      row :delivery_company
      tag_row :status
    end
  end

  form do |f|
    f.inputs do
      f.input :status
      f.input :delivery_company
    end
    f.actions
  end
end

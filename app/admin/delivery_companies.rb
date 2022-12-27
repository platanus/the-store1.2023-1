ActiveAdmin.register DeliveryCompany do
  permit_params :name, :phone_number

  index do
    selectable_column
    id_column
    column :name
    column :phone_number
    actions
  end

  show do
    attributes_table do
      row :name
      row :phone_number
    end
  end
end

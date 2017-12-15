ActiveAdmin.register Room do
  permit_params :name, :description, :capacity, :price, :room_amount

  filter :name
  filter :capacity
  filter :price
  filter :room_amount

  index do
    column :name
    column :description do |r|
      truncate(r.description, length: 120)
    end
    column :capacity
    column :price do |r|
      number_to_currency(r.price)
    end
    column :room_amount
    actions
  end

  show do
    attributes_table do
      row :name
      row :description
      row :capacity
      row :price do |r|
        number_to_currency(r.price)
      end
      row :room_amount
    end
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :description
      f.input :capacity
      f.input :price
      f.input :room_amount
    end
    f.actions
  end



end

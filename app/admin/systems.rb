ActiveAdmin.register System do
  filter :name
  # index do
  #  column "Название", :name
  #  actions
  #end
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name
  actions :all
  form do |f|
    f.inputs 'Name' do
      f.input :name
    end
    f.actions
  end
  #
  # or
  #
  # permit_params do
  #   permitted = [:name]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end

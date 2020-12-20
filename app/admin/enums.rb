ActiveAdmin.register Enum do
  index do

    column "Название", :name
    column "Кратко", :short
    column "Система", :system
    actions
  end
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment

  filter :name
  filter :system
   permit_params :name, :short, :kind, :system_id
  actions :all
  form do |f|
    f.inputs 'Name' do
      f.input :name
    end
    f.inputs 'Short name' do
      f.input :short
    end
    f.inputs 'Kind' do
      f.input :kind
    end
    f.inputs 'System' do
      f.input :system_id, :as => :select, :collection => System.all
    end
    f.actions
  end
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :short, :kind, :system_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end

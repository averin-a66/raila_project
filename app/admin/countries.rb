ActiveAdmin.register Country do
  index do
    column "Страна", :state
    column "Система", :system
    actions

  end
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :state, :system_id
  actions :all

  #
  # or
  #
  # permit_params do
  #   permitted = [:country, :system_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end

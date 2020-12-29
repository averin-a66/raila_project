ActiveAdmin.register ActiveAdmin::Comment, :as => "ActAdmComments" do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :namespace, :body, :resource_type, :resource_id, :author_type, :author_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:namespace, :body, :resource_type, :resource_id, :author_type, :author_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end

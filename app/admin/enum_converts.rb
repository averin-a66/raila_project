ActiveAdmin.register EnumConvert do
  filter :enum_from
  filter :enum_to
  index do
    column "From", :enum_from
    column "To", :enum_to
    column "Ratio", :ratio
    actions
  end
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :enum_from_id, :enum_to_id, :ratio
  actions :all
  form do |f|
    f.inputs 'From' do
      f.input :enum_from_id, :as => :select, :collection => Enum.all
    end

    f.inputs 'to' do
      f.input :enum_to_id, :as => :select, :collection => Enum.all
    end

    f.inputs 'Ratio' do
      f.input :ratio
    end
    f.actions
  end
  #
  # or
  #
  # permit_params do
  #   permitted = [:enum_from_id, :enum_to_id, :ratio]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end

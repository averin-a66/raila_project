ActiveAdmin.register Recipe do
  form partial: 'form'
     index do
     column "Название", :name
     column "Описание", :body
     column "Создал", :user_id
     actions
     end
     permit_params :name, :body
     actions :all
  #scope :all, :default => true
  filter :name
  filter :user
    #scope :due_this_week do |recipes|
    # recipes.where(‘created_at < ?’, Time.now, 1.week.from_now)
    #end
    # scope :late do |recipes|
    #   recipes.where(‘due_date < ?’, Time.now)
    #end
    #scope :mine do |recipes|
    #  recipes.where(:admin_user_id => current_admin_user.id)
    #end
    form do |f|
      f.inputs 'Details' do
        f.input :name

      end
      f.inputs 'Content', :body
       f.inputs do
        f.has_many :ingrs, heading: 'Ingredients',
                allow_destroy: true,
                   new_record: true do |a|
          a.input :name_in
          a.input :amount_in
          # a.collection_select(:enum_id,  Enum.all.order(:name), :id, :name, prompt: true)
          a.input :enum_id, :as => :select, :collection => Enum.all

        end

      end
      f.inputs do
        f.has_many :comments,
                   new_record: 'Leave Comment',
                   remove_record: 'Remove Comment',
                   allow_destroy: -> (c) { c.author?(current_admin_user) } do |b|
          b.input :body
        end

      end
      f.actions

    end
     show :name => :name do
       attributes_table_for recipe do
         row :body
         end
       panel "Ingrs" do
        table_for recipe.ingrs do
           column :name_in
           column :amount_in
           column :enum

         end
       end
       panel "Comments" do
         table_for recipe.comments do
           column :user_id
           column :body
         end
       end
       active_admin_comments
     end
    # See permitted parameters documentation:
    # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
    #
    # Uncomment all parameters which should be permitted for assignment
    #
    # permit_params :name, :body,  :user_id
    #
    # or
    #
    # permit_params do
    #   permitted = [:user_id, :name, :body]
    #   permitted << :other if params[:action] == 'create' && current_user.admin?
    #   permitted
    # end


  end

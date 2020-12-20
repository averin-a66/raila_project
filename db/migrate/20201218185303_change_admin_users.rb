
class ChangeAdminUsers < ActiveRecord::Migration[6.0]
  def change
    user = AdminUser.new
    user.email = "admin@example.com"
    user.password = "password"
    user.save
      end
end

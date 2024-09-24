class AddImageToCompanies < ActiveRecord::Migration[7.1]
  def change
    add_column :companies, :image, :string
  end
end

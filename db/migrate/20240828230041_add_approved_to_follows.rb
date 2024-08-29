class AddApprovedToFollows < ActiveRecord::Migration[7.1]
  def change
    add_column :follows, :approved, :boolean
  end
end

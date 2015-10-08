class AddSubjectToStudent < ActiveRecord::Migration
  def change
    add_column :students, :subject, :string
    add_column :students, :message, :string
  end
end

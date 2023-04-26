class AddReferenceToCats < ActiveRecord::Migration[7.0]
  def change
    add_reference(:cats, :owner, null: true, foreign_key: { to_table: :users })
  end
end
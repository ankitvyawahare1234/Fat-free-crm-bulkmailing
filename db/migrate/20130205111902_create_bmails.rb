class CreateBmails < ActiveRecord::Migration
  def change
    create_table :bmails do |t|
      t.string :to
      t.string :cc
      t.string :bcc
      t.string :subject
      t.text :body

      t.timestamps
    end
  end
end

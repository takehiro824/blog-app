class CreateBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :blogs do |t|

      t.timestamps
      t.string       :body
      t.references    :user, foregin_key: true
    end
  end
end

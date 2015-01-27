class BlogPostBelongsToUser < ActiveRecord::Migration
  def change

    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.timestamps null:false
    end

    create_table :blog_posts do |t|
      t.belongs_to :user, index: true
      t.string :title
      t.string :body
      t.timestamps null: false
    end
    
  end

end

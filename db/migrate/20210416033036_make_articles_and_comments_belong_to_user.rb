class MakeArticlesAndCommentsBelongToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :articles ,:user_id, :integer
    add_column :comments ,:user_id, :integer

    user = User.find_or_initialize_by(email: 'system@example.com')
    user.password = 'student'
    if user.save
      Article::all.each do |article|
        article.user = user
        article.save
      end
      Comment::all.each do |comment|
        comment.user = user
        comment.save
      end
      end
  end
end

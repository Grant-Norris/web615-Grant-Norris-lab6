def create_user
  email = Faker::internet::email
  user = User.find_or_initialize_by(email: email)
  if user.new_record?
    user.password = SecureRandom.uuid
  end
  user.save
  return user
end
def create_article
  user = create_user
  article = Article.new
  article.title = "Will #{Faker::Company.name} really #{Faker::Company.bs}?"
  paragraph_1 = Faker::Lorem.paragraphs.join(' ')
  paragraph_2 = Faker::Books::Lovecraft.paragraphs.join(' ')
  paragraph_3 = Faker::Hipster.paragraphs.join(' ')
  article.content = "#{paragraph_1} <br /> #{paragraph_2} <br /> #{paragraph_3}"
  article.user = user
  if article.save
    p "#{article.title} has been saved"
  else
    p article.errors
    end
  return article
end
def create_comment(article:)

  comment = Comment.new
  comment.article = article
  comment.message = Faker::Hacker.say_something_smart
  if comment.save
    p "Comment #{ii} has been saved for article #{article.title}"
  else
    p comment.errors
  end
end
for i in 1..100
  article = create_article
    for ii in 1..10
      create_comment(article: article)
    end
end

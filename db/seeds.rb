30.times do
  sentense = rand(20)
  title = Faker::Hipster.sentence(word_count: 3)
  body = Faker::Lorem.paragraph(sentence_count: sentense)
  Question.create title: title, body: body
end
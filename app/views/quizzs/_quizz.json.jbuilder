json.extract! quizz, :id, :question, :ans1, :ans2, :ans3, :correctAns, :created_at, :updated_at
json.url quizz_url(quizz, format: :json)
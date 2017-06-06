15.times do 
  name = Faker::Name.first_name
  quote = Faker::TwinPeaks.quote

  Dog.create!(
              name: name,
              quote: quote,
              price: 20
              )
end
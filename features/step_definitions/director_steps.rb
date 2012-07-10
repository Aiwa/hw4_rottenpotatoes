# Add a declarative step here for populating the DB with movies

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    Movie.create!(movie)
  end
end

Then /^the director of "(.*)" should be "(.*)"$/ do |e1, e2|
  page.body =~ /#{e1}.+director.+#{e2}/m
end

Then /I should see "(.*)" before "(.*)"/ do |f1, f2|
  page.body =~ /#{f1}.+#{f2}/m
  #  ensure that that e1 occurs before e2.
  #  page.content  is the entire content of the page as a string.
  #flunk "Unimplemented"
end


And /I should see all of the movies/ do
   movies = Movie.all.map(&:title)
   assert_equal page.all('table#movies tbody tr').count, movies.length
   movies.each do |movie|
     step %Q{I should see "#{movie}"}
   end
   #rows = page.all('#movies tr').size -1
   # assert rows == 0
end

And /I should not see all of the movies/ do
   #movies = Movie.all.map(&:title)
   #assert_equal page.all('table#movies tbody tr').count, movies.length
   #movies.each do |movie|
     #step %Q{I should not see "#{movie}"}
   #end
   #rows = page.all('#movies tr').size -1
   #assert rows == 0
end



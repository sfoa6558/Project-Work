Given("I navigate to the User Table") do
  visit(UserPage)
end

And("I add a user {string}") do |string|
  on(UserPage) do  |page|
    page.add_user(string , "Customer")
  end
end

And("I verify user {string} is added") do |string|
  on(UserPage) do  |page|
    found =  page.find_user?(string)
    expect(found).to be_truthy
  end
end

And("I delete a user {string}") do |string|
  on(UserPage) do  |page|
    page.delete_user(string)

  end
end

And("I verify user {string} is deleted") do |string|
  on(UserPage) do  |page|
    found =  page.find_user?(string)
    expect(found).to be_falsey
  end
end
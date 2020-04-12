class UserPage
  include PageObject
  page_url "http://www.way2automation.com/angularjs-protractor/webtables/"

  text_field(:first_name, name:"FirstName")
  text_field(:last_name, name:"LastName")
  text_field(:user_name, name:"UserName")
  text_field(:password, name:"Password")
  text_field(:email, name:"Email")
  text_field(:mobile, name:"Mobilephone")
  radio_button(:company, value: '15')
  select_list(:Role,name:"RoleId")

  def add_user(name, option)
    @browser.button(:index => 0).click
    self.first_name = name
    self.last_name = 'smith'
    self.user_name = 'smith'
    self.password = 'smith'
    self.email = 'smith@yahoo.com'
    self.mobile = '3125551212'
    self.company_element.click
    self.select_list(:name, "RoleId").select option
    @browser.button(:value => "Save").click
  end

  def find_user?(name)
    find_user = false
    user_table = @browser.table(:index => 0)
    user_table.rows.each do |row|
      row.cells.each do |cell|
        find_user = true if cell.text == name
      end
    end
    find_user
  end

  def delete_user(name)
    user_table = @browser.table(:index => 0)
    user_table.rows.each do |row|
      row.cells.each do |cell|
        if cell.text == name then
          row.cells[10].button.click
          @browser.button(:value => "OK").click
        end
      end
    end
  end

end
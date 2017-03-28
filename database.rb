class Person
  attr_reader "name", "phone_number", "address", "position", "salary", "slack_account", "github_account"

  def initialize(name, phone_number, address, position, salary, slack_account, github_account)
    @name = name
    @phone_number = phone_number
    @address = address
    @position = position
    @salary = salary
    @slack_account = slack_account
    @github_account = github_account
  end
end

class EmployeeDatabase
  def initialize
    @profiles = []
  end

  def initial_question
    puts "(A) Add a profile (S) Search for a profile (D) Delete a profile "
    initial = gets.chomp.upcase
  end

  def add_person
    puts "What is the name? "
    name = gets.chomp

    if name.empty?
      puts "Name can not be black! "
    end

    puts "What is the phone_number?"
    phone_number = gets.chomp

    puts "What is the address?"
    address = gets.chomp

    puts "What position?"
    position = gets.chomp

    puts "What salary?"
    salary = gets.chomp.to_i

    puts "What is the slack_account?"
    slack_account = gets.chomp

    puts "What is the github_account?"
    github_account = gets.chomp

    person = Person.new(name, phone_number, address, position, salary, slack_account, github_account)

    @profiles << person

    puts "You have added #{name}."
    puts "#{name}\'s phone_number is #{phone_number}."
    puts "#{name} lives at #{address}."
    puts "Their position with the company is #{position} and they make $#{salary} a year."
    puts "The slack_account is #{slack_account}."
    puts "The gitHub_account is #{github_account}.\n\n"
  end

  def search_person
    puts "Please type in persons name. "
    search_person = gets.chomp
    found_account = @profiles.find { |person| person.name.include?(search_person) || person.slack_account == search_person || person.github_account == search_person }
    if found_account
      puts "This is #{found_account.name}'s information.
      \nName: #{found_account.name}
      \nPhone: #{found_account.phone_number}
      \nAddress: #{found_account.address}
      \nPosition: #{found_account.position}
      \nSalary: #{found_account.salary}
      \nSlack Account: #{found_account.slack_account}
      \nGitHub Account: #{found_account.github_account}"
    else
        puts "#{search_person} is not in our system.\n"
    end
  end

  def delete_person
    print "Please type in persons name. "
    delete_name = gets.chomp
    delete_profile = @profiles.delete_if { |person| person.name == delete_name}
    if delete_profile
      puts "profile deleted"
    else
      puts "profile not found"
    end
  end

  def main
    user_input = ()
    while user_input != ""
      user_input = initial_question
      if user_input == "A"
        add_person
      elsif user_input == "S"
        search_person
      elsif user_input == "D"
        delete_person
      else
      puts "That was not an option!"
      end
    end
  end
end

EmployeeDatabase.new.main

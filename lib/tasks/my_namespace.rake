require 'highline/import'

namespace :user do
  desc "Create User"
  task create: :environment do
  	flag = true
  	while flag
       print "Specify username: "
       username = $stdin.gets

       print "Specify First name : "
       first_name = $stdin.gets
      
       print "Specify Last name : "
       last_name = $stdin.gets
     	
       role = "SuperAdmin"

       print "Specify  [admin@gmail.com]: "
       email = $stdin.gets

       if !(email =~ /^([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})$/i).nil?
        password_flag = true
        
        while password_flag
          password=ask("Specify password[admin123] : ") {|x| x.echo="*"} 
         
          if password.length >= 8
            User.create(username: username,first_name: first_name,last_name:last_name,role:role,email: email, password: password)
            puts "Admin is created successfully."
            flag = false
          break
        else
          puts "Invalid password. Try again (Min 8 character)."
          next
        end
      end
    else
      puts "Invalid email. Try again."
      next
    end
  end
  end

  desc "TODO"
  task my_task2: :environment do
  end

end

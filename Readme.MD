Project 360
======================
Photo Upload and editing website
Ruby on Rails

* Billy Bui
	* E-Mail: bvbui@asu.edu
	* ID #: 1203477491
* Hector Calderon
	* E-Mail: hhcalder@asu.edu
	* ID #: 1203023466  
* Stephen Klaus
	* E-Mail: ssklaus@asu.edu
	* ID #: 1205720980



Setup and Instruction
======================

Ruby 2.0 or higher necessary.
	Skip to bottom for instructions, though each install will be different-Google will help.

1. Go to project root and get dependencies:
```sh 
'bundle install'
```
2. Launch rails server
```sh
'rails s' or 'rails server'
```
3. In your favorite browser:
```sh
‘localhost:3000’
```
	>it may be necessary to run command as login shell 'bin/rake db:migrate RAILS_ENV=development'
4. Enjoy the website! Login or create user. 
5. To kill the server, in terminal 
6. ```sh
'ctrl+c'
```

To Run Test
======================

1. Type:
```sh
‘rake db:migrate’
```
2. View test log
    * Example Log:
	```sh
	hectors-mbp-2:Project360 Hector$ rake test
	Run options: --seed 61252

	#Running:

	..F.........

	Finished in 9.603968s, 1.2495 runs/s, 1.4577 assertions/s.

  	1) Failure:
	UsersControllerTest#test_should_redirect_to_sign_up_page_if_not_signed_in
	[/Users/Hector/Dropbox/Project360/test/controllers/users_controller_test.rb:35]:
	Expected response to be a <redirect>, but was <200>

	12 runs, 14 assertions, 1 failures, 0 errors, 0 skips
	```

Early stages testing video
======================
>Video 01--Iteration 1:
* http://youtu.be/TcwIZzLvtow

>Video 02--Username and PW test check/failing:
* http://youtu.be/edIjVFsaKv0

>Video 03--Demo 1 Creating a username:
* http://youtu.be/PIzXU8_qvj0

>Video 04--Demo 2 Uploading and editing an image
* http://youtu.be/meqSUv5-SUY

Ruby Installation
======================

* RVM is a useful tool confirmed to work on ubuntu and linux mint 
* The following instructions are confirmed to work on a mac.
* Avoid windows--it's terrible-lol
* Please Make Sure You are Administrator or have Administrator Access. If you don’t have access then you may run into problems with the install process and installing gems. This will not allow you to run our tool.

>In terminal (Follow These Steps to Install Latest Version of Ruby):

>Step 1:
```sh
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

>Step 2:
```sh
brew install rbenv ruby-build
```
>Step 3: (Install Latest Version of Ruby)
```sh
rbenv install 2.1.3
rbenv global 2.1.3
```
>Step 4:  (Installs Ruby 2.1.3)
```sh
ruby –v
```
>Step 5: (Install Ruby Rails)
```sh
gem install rails
```
>Step 6: (Allowing the Rails Executable to see “RBENV”
```sh
rbenv rehash
```
>Step 7: ( Verify Rails is Installed ) 
```sh
rails -v
```
>END
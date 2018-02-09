# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app :: application is built using sinatra gem, MVC design pattern, each of the models inherit from Sinatra::Base class
- [x] Use ActiveRecord for storing information in a database :: application is build using ActiveRecord with Sinatra
- [x] Include more than one model class (list of model class names e.g. User, Post, Category) :: User, Testcase, Feature, FeatureTestcase
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Posts) :: User has_many Testcases, Testcases has_many Features, Features has_many Testcases
- [x] Include user accounts :: my application includes ability to sign up or login with existing account. It is achieved by storing user_id in session on signup/login, and clearing out session on logout.
- [x] Ensure that users can't modify content created by other users :: only the user who created the particular testcase can modify it.
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying :: belongs_to resource is Testcase, it has routes for each of the CRUD actions.
- [x] Include user input validations :: the application validates presence of name, email, password on signup, and email and password on login, as well as uniqueness of email on signup, so that bad data is not created.
- [x] Display validation failures to user with error message (example form URL e.g. /posts/new) :: using session and flash, error message is displayed when sign up or login fails because of validation
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code :: added README

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message

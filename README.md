Rails Line Server
=================
This is a simple api server built using the rails-api gem for a Salsify coding test: https://salsify.github.io/line-server.html. This system serves a single purpose: to serve the text of a line of a text file via a GET request and it should perform well under load. It uses a database to index the text file in order to handle requests efficiently.

Setup
=====
1. Clone down this repository.
2. Run `build.sh` to generate sample text files to work with.
3. Run `run.sh <file.txt>` with the name of the text file as the parameter you want to serve. This will:
    * Run bundler
    * Start a pg server
    * Create a development and a test database
    * Run migrations
    * Seed the database with the text file specified
    * Start the server in development mode

Questions
=========
##### How does your system work? (if not addressed in comments in source)
Instead of storing an index of the text file in memory, the lines of the text file are instead stored in a database table with 2 specified columns, line_text and line_index. An index was added to 'line_index' for faster lookups. 

##### How will your system perform with a 1 GB file? a 10 GB file? a 100 GB file?
The api should perform equally well regardless of how large the initial text file given that we have imported that contents into our database resulting in constant O(1) access times. We've avoided the O(n) or on average O(n/2) problem of 

##### How will your system perform with 100 users? 10000 users? 1000000 users?
The performance of the api under increased concurrency of users will depend on the performance of the application server along with the number of cpu cores and memory the system has. I'm not sure exactly how to optimize this but from what I've read Unicorn is a good choice for a dedicated API server given its high marks on concurrency tests. A Puma and JRuby interpreter implementation may be more optimal here however given that our code is thread safe. 

##### What documentation, websites, papers, etc did you consult in doing this assignment?
* https://blog.engineyard.com/2014/ruby-app-server-arena-pt1 & https://blog.engineyard.com/2014/ruby-app-server-arena-pt2
* https://blog.heroku.com/archives/2013/2/27/unicorn_rails
* http://wyeworks.com/blog/2015/4/20/rails-api-is-going-to-be-included-in-rails-5
* http://stackoverflow.com/
* https://www.airpair.com/ruby-on-rails/posts/building-a-restful-api-in-a-rails-application

##### What third-party libraries or other tools does the system use? How did you choose each library or framework you used?
* Rails-API gem - I used this after hearing about it at this years RailsConf and that it would be incorporated into Rails 5. Also used it because of my familiarity with the framework.
* Unicorn - I used this application server after reading the pros and cons of the variety of popular options out there: Passenger, Thin, Goliath, etc.
* Apache Bench/Siege - benchmarking tool

##### How long did you spend on this exercise? If you had unlimited more time to spend on this, how would you spend it and how would you prioritize each item?
I spent about 4 hours writing the actual code for this and spent 12+ hours researching it. I think what I learned most from this was the importance of the tools you use to accomplish your goals. For example, WeBrick is the default web server that ships with Ruby that can really hinder you if you also use it in production. You don't really notice a difference when working on small projects but all of these tools have tasks that's specialized for. 

##### If you were to critique your code, what would you have to say about it?
In retrospect, I think leaning on a database was not the goal of this assignment. After glancing at the instructions, I immediately thought the api assignment was to design it with lots of frills, e.g. token authentication or fancy javascript api documentation, in order show off a diversity of skills. After working through it however I think I relied too much on the convention that Rails provides to craft this and that's not that interesting.

Given unlimited time, I'd like to rewrite this without Rails and also using a different ruby interpreter and run benchmarks to see the performance differences. Tomorrow I'll try to do this below this space.

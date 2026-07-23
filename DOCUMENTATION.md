# Grails Project Documentation - university
# Day 6

# Task 3

1- Domain
   Contains Domain classes (models), each class here is automatically mapped to a database table via GORM (Grails Object Relational Mapping). Domain classes define properties and validation rules (constraints) , but it's now empty because i haven't creat any domain classes yet .

2- Controllers
   An intermediary between user and service, contains Controller classes responsible for receiving HTTP requests from the user, processing them (typically by coordinating with services and domain classes), and returning a response (a view, JSON, or plain text).

3- Services
   Contains Service classes that hold the application's business logic. Services are called from controllers and are transactional by default, meaning Grails handles database operations safely and consistently, used for Writing application logic, code reusability, handling transactions, and organizing code through separation of concerns.

4- Views
   Contains GSP (Groovy Server Pages) files, a mix of HTML and Groovy code used to render dynamic content to the user. initially contains (error, index, notfound) .gsp files, the shared template used across all pages, used for Web page design, displaying data to the user, and creating forms.

5- Conf
   The conf folder contains the configuration files that control the behavior and settings of a Grails application (application.yml, application.groovy, ...). It defines application-level properties such as database connections, URL mappings, security settings, and environment-specific configurations.

6- i18n
   Used for internationalization and localization in Grails applications. It contains message files that store text translations for different languages. Instead of writing fixed text in views, developers use message keys, allowing the application to display content based on the user's selected language. This makes the application easier to maintain and support multiple languages.

7- init
   The init folder contains the initialization files of a Grails application. It is responsible for starting and configuring the application when it runs. The main file, Application.groovy, defines the application entry point and can be used to execute startup logic and initialize required components.


# Task 5

                                      Groovy                                       java
--------------------------------------------------------------------------------------------------------------------------------

1- keyword vs Explicit Types          def name = "Noora"                           String name = "Noora";
                                      def age = 21                                 int age = 21 ;
                                      println name                                 System.out.println(name);

---------------------------------------------------------------------------------------------------------------------------------
   
2- Method Definition                  def greet(name){                             public String greet(String name){
                                        return "Hello $name" }                         retrun "Hello " + name ; }

---------------------------------------------------------------------------------------------------------------------------------

3- Closures vs Lambda/                def numbers = [1,2,3]                        List<Integer>numbers = Arrays.asList(1,2,3);
   Anonymous Functions                numbers.each{n -> println n}                 numbers.forEach(n -> System.out.println(n));

---------------------------------------------------------------------------------------------------------------------------------

4- Closure with Parameters            def square = {x -> x * x}                    Function<Integer,Integer>square = x -> x * x;
                                      println square(5)                            System.out.println(square.apply(5));

---------------------------------------------------------------------------------------------------------------------------------

5- Optional Semicolons                def message = "hello"                        String message = "hello" ;
                                      prinln "hi"                                  System.out.println("hi");

---------------------------------------------------------------------------------------------------------------------------------
                                                



   

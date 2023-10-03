## Commercial Mapping: Customer Relationship Management System for Graduation Companies

This project proposes the development of a web application to be used by the commercial sector of graduation companies, proposing significant improvements in the way of managing their negotiations through the proper registration of information in the system. By registering both successful and unsuccessful negotiations, the application will enable the extraction of valuable market statistics and insights.

This application originated from the repository [lucasgeron/Mapeamento-Comercial](https://github.com/lucasgeron/Mapeamento-Comercial) witch was developed on AppSheet. This repositorie is the web version of what was developed previously.

### Author
- Lucas Fernando Geron

### Institution
- Universidade Tecnológica Federal do Paraná - Campus Guarapuava

### Images Demo
![image](https://storage.googleapis.com/turing_developers/portfolio/1691423969965_Screenshot_1.jpg)
![image](https://storage.googleapis.com/turing_developers/portfolio/1691423969967_Screenshot_2.jpg)
![image](https://storage.googleapis.com/turing_developers/portfolio/1691423969967_Screenshot_3.jpg)
![image](https://storage.googleapis.com/turing_developers/portfolio/1691423969967_Screenshot_4.jpg)
![image](https://storage.googleapis.com/turing_developers/portfolio/1691423969967_Screenshot_5.jpg)
![image](https://storage.googleapis.com/turing_developers/portfolio/1691423969968_Screenshot_6.jpg)
![image](https://storage.googleapis.com/turing_developers/portfolio/1691423969968_Screenshot_7.jpg)
![image](https://storage.googleapis.com/turing_developers/portfolio/1691423969968_Screenshot_8.jpg)

----

### Installation Guide

This guide will help you configure and run FORMAgestor locally on your computer.

### 1. Requirements

Firstly install the following applications:

* [Docker Engine](https://docs.docker.com/engine/install/)
* [Docker Compose](https://docs.docker.com/compose/install/)

**Note:** Commands started with $ are executed on terminal without super user (sudo).

### 2. Create workspace folder:
Use the commands below to create and access the new folder:

    $ mkdir workspace
    $ cd workspace

### 3. Clone the project

If you have ssh set up with git, to clone the project run:

    $ git clone git@github.com:lucasgeron/FORMAgestor.git
    
otherwise    

    $ git clone https://github.com/lucasgeron/FORMAgestor.git
    

### 4. Access the project folder
Access the project folder:

    $ cd FORMAgestor
    
**Note:** If you have Ruby installed locally, you may see the following message bellow at this point. However, since the application will run in containers, you do not need to worry about this warning. You can simply ignore it and continue with the installation guide.

    RVM used your Gemfile for selecting Ruby, it is all fine - Heroku does that too,
    you can ignore these warnings with 'rvm rvmrc warning ignore /home/linux/workspace/FORMAgestor/Gemfile'.
    To ignore the warning for all files run 'rvm rvmrc warning ignore allGemfiles'.

    Unknown ruby interpreter version (do not know how to handle): ~>3.2.
    
### 5. Build the containers

Before you continue, make sure the Docker is running.

In your terminal, Login in docker hub:

    $ docker login

Next, build the containers:

If you are on **Mac OS** or **WLS2**:

    $ docker build .
    
If you are on **Linux**:

    $ docker build --build-arg USER_ID=$(id -u) --build-arg GROUP_ID=$(id -g) .
    
**Note:** The command above ensures that the user who builds the container has the same user and group IDs as the user who is building the image. 

### 6. Setup env variables

Create a file **"application.yml"** using the example **"application.yml.example"**:

    $ cp config/application.yml.example config/application.yml

If necessary, change  **username**, **password** and **host** from database settings.     
By default, it will work with no changes.

### 7. Install dependencies 

**Ruby Gems:** To download and install ruby gems dependencies run:

    $ docker compose run --rm web bundle install

**Yarn:** To download and install node dependencies run:

    $ docker compose run --rm web yarn install
    

### 8. Create database

To create the **FORMAgestor database** run:

    $ docker compose run --rm web bundle exec rails db:create
    
### 9. Run Migrations

To create the tables schema on FORMAgestor database run: 

    $ docker compose run --rm web bundle exec rails db:migrate
    
### 10. Run Seed

To populate the application with required and defaults values:

    $ docker compose run --rm web bundle exec rails db:seed


### 10. Up the container web

    $ docker compose up -d web
    

### 11. Access the application

In your browser access **localhost** through the port **:3000**

* [http://localhost:3000](http://localhost:3000) 

### 12. Login in the application

To finish this installation guide, perform a [login](http://localhost:3000/users/sign_in) on the application using the following credentials:

> **username:** admin@formagestor   
**password:** 123456

If all work's as expected, you should be redirected to application prospections.

-----
### Populate the database  (optional)

To populate the application with the **valid data** generated trougth a study of many cities.

    docker compose run --rm web rails db:seed 

This command will populate the main database with some data.

You can also add more data to application by editing the seed file with _client_id_ and running the custom seed command:

    docker compose run --rm web rails db:seed:MODEL

| Model Name | MODEL |
|------------|-------|
| App/City       |app_city|
| App/Company    |app_company|
| App/Institution|app_institution|
| App/Course     |app_course|
| App/Student    |app_student|
| App/Vendor     |app_vendor|
| App/Prospect   |app_prospect|
| App/Service    |app_service|
| App/Semester   |app_semester|
| App/User       |app_user|
| App/Client     |app_client|

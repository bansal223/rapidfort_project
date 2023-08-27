RapidFort Project

Title:
Creating a REST API-based web server to handle file uploads is a multi-step process. Before we get into the steps, let's articulate the problem statement

# Problem Statement:

Design and develop a RESTful web server hosted on a laptop that allows users to upload files. Upon receiving a file, the server should return information about the file to the user.

Solution:
1. Requirements:
Programming Language: Python (because of its simplicity and wide usage)
Web Framework: Flask (a lightweight web framework suitable for this kind of task)
Required Libraries/Modules: Flask, Werkzeug (for handling file uploads)

2. create the REST API: Check "app.py" file.

3. Test the server:

    Start the server by running the Python script.
Use a tool platform like Postman to test the /upload endpoint. Send a POST request with a file attached to see the response.
http://127.0.0.1:5000/upload



4. Hosting the server on your laptop:

    Ensure your firewall settings allow incoming connections on the port you've set (default is 5000 for Flask).

    If you want others outside your network to access the server, you'll need to perform port forwarding on your router. Please consult your router's manual for more details.

    Be cautious when allowing external access as there are security implications. You might want to consider securing the API with authentication or other mechanisms.


5. Potential Enhancements:

     Implement authentication to secure your API.

      Store uploaded files in a more sophisticated storage system (like cloud storage) instead of local filesystem.


# API definition and clarity of REST: Use of GET vs. POST

  REST (Representational State Transfer) is an architectural style that is commonly used in the development of web services. It defines a set of conventions for CRUD (Create, Read, Update, Delete) 
    operations on resources using stateless protocols, typically HTTP.

  When we talk about the RESTful approach in the context of HTTP, it's critical to use the right HTTP methods (verbs) for different operations to adhere to the principles of REST. Two of the most commonly 
     used HTTP methods are GET and POST. Let's explore the differences, use cases, and some best practices.

### GET

Definition: Requests data from a specified resource.

Safety: It's considered a "safe" method, meaning it is used for information retrieval and shouldn't change the state of the server. Safe here implies that the operation is idempotent and has no side effects.

Idempotence: Yes, making the same GET request multiple times will yield the same result without causing any side effect.

Data Passing: Data is passed as query parameters in the URL.

Use Cases:
Retrieve data or information.
Fetching resources without causing side effects.

Length Limit: URLs are limited in length, so sending large amounts of data via GET is not advisable.

Visibility: Data is visible in the URL, making it unsuitable for sensitive data.

Caching: Responses can be cached.


### POST


Definition: Sends data to a server to create or update a resource.

Safety: It's considered an "unsafe" method as it may change the server's state.

Idempotence: No, making the same POST request multiple times may have different effects or produce different resources.

Data Passing: Data is passed in the body of the request.

Use Cases:

Creating a new resource.

Submitting data to be processed to a specified resource.

Any operation that results in a change on the server (like uploading a file).

Length Limit: No limitations on data length, as data is in the body.

Visibility: Data is hidden from the URL, making it suitable for sensitive data.

Caching: Responses typically shouldn't be cached.

# Add a simple UI to this webserver.
Run the python script on http://127.0.0.1:5000/upload

The HomePage of the Application Looks like this:

![1](https://github.com/bansal223/rapidfort_project/assets/77323386/5a78432c-c24e-4fb1-8f54-ba2de76ad4c3)

Upload Any Type of file 

![3](https://github.com/bansal223/rapidfort_project/assets/77323386/ed577438-34b0-40b6-b4f8-3a3a7d01ba01)

You will get all the Information About the File


![4](https://github.com/bansal223/rapidfort_project/assets/77323386/23941247-4b6d-418a-9b61-ca67d8cdc2e7)

# Add a Github action or equivalent pipeline to build a docker container

GitHub Actions allow you to automate, customize, and execute software development workflows directly in your GitHub repository. One common use case for GitHub Actions is to automatically build Docker containers when code is pushed to a repository.

Here's a guide on how to set up a GitHub Action to build a Docker container

  1. Dockerfile is already added in the repository.

  2. Set Up GitHub Actions Workflow: 
    
     create yaml file in github

  3. Image is added to the Docker Hub(https://hub.docker.com)
   
   ### Image Link: https://hub.docker.com/repository/docker/shaanb/hey-rapidfort-project/general

   To Run this Image you need to run the following Commands:

      1. docker pull shaanb/hey-rapidfort-project:0.0.1.RELEASE
     
      2. docker run -d -p 5000:5000 shaanb/hey-rapidfort-project:0.0.1.RELEASE
  
      3. http://localhost:5000/upload

output: 

![5](https://github.com/bansal223/rapidfort_project/assets/77323386/9411f205-58f7-4391-82b4-817792350f8e)


# Run the container via a bash script

With the Help of "run_container.sh" we can run the container.



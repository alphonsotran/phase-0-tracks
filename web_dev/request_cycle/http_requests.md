What are some common HTTP status codes?
Some of the common HTTP status codes are 404-requested resource is no longer available; 403-access to the resource is forbidden; 500-server side error code that could be anything; and 504-a gateway timeout. 

What is the difference between a GET request and a POST request? When might each be used?
GET requests data from a specified resource and include all required data in the URL. POST requests gives additional data from the browser to the server in the message body. GET request should be used to fetch data from the server and shouldn't change the server. POST requests should be used to insert/update remote data and is ok to change the server.  

Optional bonus question: What is a cookie (the technical kind, not the delicious kind)? How does it relate to HTTP requests?
A cookie is smaller size data that is sent from the website that was visited and stored on a user's browser and computer. It is used to identify the user and populate the user's preferences on the page whenever revisiting the website. Cookies are passed as HTTP headers. The server will send a response header to the browser to set a cookie field. If there is a cookie set, then the browser sends the cookie back to the server. 
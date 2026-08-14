Purpose and Benefits of Nginx as a Reverse Proxy:
In this setup, Nginx sits in front of the flask app to receive incoming web requests on port 80 and pass them to the application.
* It shields the Flask application from direct internet access and hides internal app details.
* Nginx handles network connections fast and efficiently, allowing the Flask app to focus only on processing data.
* It simplifies adding HTTPS encryption, caching, and load balancing in the future without changing the app code.


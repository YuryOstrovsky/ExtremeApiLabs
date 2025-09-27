# ExtremeApiLabs
Online classes for API teaching different Extreme Networks APIs http://apilabs.extremewireless.ca

Files in the project : 

- app.py - this is the main Flask application 

- start_container.py - script which starts Docker container with Jupyter

- url_constract.py - script which is building the URL to accees particular Jupiter (every time its a new token and port)

- ports.txt - just a placeholder file which is automatically updated every time Docker container starts (starting from port 8888 then +1)

- count_images.py - script conts how many Docker images running at the moment. When it reaches 50 it will not let user run any more and will ask to come back tomorrow

- ./templates/landing.html - landing page for users
  
- ./templates/index.html - main page when loading iframes with Jupyter Notebook (left) and Training materials (right)

- ./static/tutorial.html , XIQCClass.html , XIQClass.html , XIQSEClass.html - class content 

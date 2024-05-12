# ExtremeApiLabs
Online classes for API teaching different Extreme Networks APIs

Files in the project : 

- app.py - this is the main Flask application 

- start_container.py - script which starts Docker container with Jupyter

- url_constract.py - script which is building the URL to accees particular Jupiter (every time its a new token and port)

- ports.txt - just a placeholder file which is automatically updated every time Docker container starts (starting from por 8888 then +1)

- count_images.py - script conts how many Docker images running at the moment. When it reaches 50 it will not let user run any more and will ask to come back tomorrow

- ./templates/index.html - main page user will see

- ./static/tutorial.html , XIQCClass.html , XIQClass.html , XIQSEClass.html - class content 

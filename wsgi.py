from app import app

if __name__ == "__main__":
    context = ('/home/jupyter/cert.pem', '/home/jupyter/key.pem')
    app.run(debug=False, port=5000, host='0.0.0.0', ssl_context=context)


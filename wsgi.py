from app import app

if __name__ == "__main__":
    context = ('cert.pem', 'key.pem')  # Path to your certificate and key files
    app.run(debug=False, port=5000, host='0.0.0.0', ssl_context=context)


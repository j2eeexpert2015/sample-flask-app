from flask import Flask,request

app = Flask(__name__)

@app.route('/')
def hello_world():
    # Get the query parameter 'name', default to 'World' if not provided
    name = request.args.get('name', 'Guest')
    # Print the query parameter to the console
    print(f"Received query parameter: name={name}")
    # Return a response with the query parameter
    return f"Hello, {name}!"
    

if __name__ == '__main__':
    #app.run(host='0.0.0.0', port=5000)
    app.run(host='0.0.0.0', port=5000, debug=True)

import os
import signal
import flask
import src.generator as generator

app = flask.Flask(__name__)

signal.signal(signal.SIGINT, lambda s, f: os._exit(0))

@app.route("/")
def generate_buzz():
    page = '<html><body><h1>'
    page += generator.generate_buzz()
    page += '</h1></body></html>'
    page = f'''<html>\
        <head>\
            <title>ci/cd</title>\
        </head>\
        <body>\
            <h1>{generator.generate_buzz()}</h1>\
        </body>\
    </html>'''
    return page

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=os.getenv('PORT')) # port 5000 is the default
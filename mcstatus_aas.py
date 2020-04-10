from flask import Flask, render_template, request, abort
from mcstatus import MinecraftServer

app = Flask(__name__)

@app.route('/')
def serve_root():
    return render_template("root.html")

@app.route('/server/<servername>/')
@app.route('/server/<servername>/status/')
def serve_status(servername):
    server = MinecraftServer.lookup(servername)
    status = server.status()

    return render_template("status.html",
            description = status.description,
            version = status.version.name,
            players = status.players
        )

@app.route('/server/<servername>/json/')
def serve_json(servername):
    server = MinecraftServer.lookup(servername)
    
    return server.status().raw

@app.route('/status')
def serve_generic():
    servername = request.args.get('server')
    statusformat = request.args.get('format', 'status')

    if servername is None:
        abort(400)

    if statusformat in ['status', 'html']:
        return serve_status(servername)
    elif statusformat == 'json':
        return serve_json(servername)
    else:
        abort(400)

from fastapi import FastAPI
from fastapi.responses import HTMLResponse

app = FastAPI()

@app.get("/", response_class=HTMLResponse)
def home():
    return """
    <html>
        <head>
            <title>Hola Mundo</title>
        </head>
        <body>
            <h1>Prueba de imagen docker</h1>
        </body>
    </html>
    """
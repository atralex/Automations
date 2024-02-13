#!/bin/bash

# Nombre del proyecto
PROJECT_NAME=$1

# Verificar que se haya ingresado un nombre de proyecto
if [ -z "$PROJECT_NAME" ]; then
    echo "Por favor ingrese el nombre del proyecto"
    exit 1
fi

# Crear directorio del proyecto y navegar a él
mkdir -p "$PROJECT_NAME"
cd "$PROJECT_NAME"

# Crear entorno virtual
python3 -m venv venv

# Activar entorno virtual
source venv/bin/activate

# Crear archivo requirements.txt
touch requirements.txt

# Instalar Flask
pip install Flask

# volcar librerias instaladas en requirements.txt
pip freeze > requirements.txt

# Crear main.py

cat > main.py <<EOL
from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello, World!'

if __name__ == '__main__':
    app.run(debug=True)

EOL

# Crear archivo .gitignore
touch .gitignore

python3 main.py

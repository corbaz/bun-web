#!/bin/bash

# Crea las carpetas principales
mkdir my-app
cd my-app
mkdir backend frontend dist

# Inicializa el proyecto de Node en general y con Bun
bun init -y

# Instalación de Tailwind y configuración del frontend
cd frontend
mkdir src
echo "<!DOCTYPE html><html><head><title>My App</title><link href='styles.css' rel='stylesheet'></head><body><script src='main.js'></script></body></html>" > src/index.html
echo "@tailwind base;\n@tailwind components;\n@tailwind utilities;" > src/styles.css
echo "document.body.innerHTML = '<h1 class=\"text-5xl text-red-500\">Hello from frontend!</h1>';" > src/main.ts

# Configuración de Tailwind CSS
bun install -D tailwindcss postcss autoprefixer
npx tailwindcss init -p
mv tailwind.config.js ../

# Volver a la raíz y configurar el backend
cd ..
cd backend
mkdir src
echo "import { serve } from 'bun'; serve({ port: 3000, fetch(req) { return new Response('Hello from backend!'); } });" > src/server.ts

# Crear archivo package.json con scripts
cd ..
echo '{
  "name": "my-app",
  "version": "1.0.0",
  "scripts": {
    "build:frontend": "bun build frontend/src/main.ts --outdir dist",
    "build:backend": "bun build backend/src/server.ts --outdir dist",
    "dev:frontend": "bun run frontend/src/main.ts --watch",
    "dev:backend": "bun run backend/src/server.ts --watch"
  }
}' > package.json

echo "Project structure created successfully! To start the project, run the frontend and backend dev scripts."

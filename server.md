Paso 1: Ejecuta nodemon Observando Archivos .ts

Cambia el comando a:

"dev": "bun run server.ts --watch",

Explicación

	•	--watch server.ts: Le indica a nodemon que observe el archivo server.ts y reinicie el servidor cada vez que se realice un cambio en el archivo.
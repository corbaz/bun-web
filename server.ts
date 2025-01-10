// server.ts
const server = Bun.serve({
    port: 2736,
    async fetch(request) {
        const url = new URL(request.url);

        // Servir el archivo index.html por defecto
        if (url.pathname === "/") {
            return new Response(Bun.file("./src/index.html"));
        }

        // Servir otros archivos estáticos (CSS, JS, etc.)
        const filePath = `./src${url.pathname}`;
        const file = Bun.file(filePath);

        if (await file.exists()) {
            return new Response(file);
        }

        // Si el archivo no existe, devolver un 404
        return new Response("Archivo no encontrado", { status: 404 });
    },
});

console.log(`Servidor corriendo en http://localhost:${server.port}`);

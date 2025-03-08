<script setup lang="ts">
import { ref, onMounted, computed } from "vue";
import axios from "axios";

interface ApiResponse {
    message?: string;
    error?: string;
}

const backendData = ref<ApiResponse | null>(null);

onMounted(async () => {
    try {
        const response = await axios.get<ApiResponse>("https://tl-showroom.equalitech.xyz/api/");
        console.log("✅ Respuesta del backend:", response);
        backendData.value = response.data;
    } catch (error: any) {
        console.error("❌ Error al conectar con el backend:", error);
        backendData.value = {
            error: error.response
                ? `Error ${error.response.status}: ${error.response.statusText}`
                : "El backend no responde.",
        };
    }
});

const formattedResponse = computed(() =>
    backendData.value ? JSON.stringify(backendData.value, null, 2) : "Cargando..."
);
</script>

<template>
    <div class="container">
        <!-- Logos -->
        <div class="logos">
            <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/vuejs/vuejs-original.svg" alt="Vue" />
            <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/vite/vite-original.svg" alt="Vite" />
            <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/fastapi/fastapi-original.svg" alt="FastAPI" />
            <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/docker/docker-original.svg" alt="Docker" />
            <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/nginx/nginx-original.svg" alt="Nginx" />
            <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/python/python-original.svg" alt="Python" />
            <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/bash/bash-original.svg" alt="Bash" />
            <div class="github-icon">
                <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/github/github-original.svg" alt="GitHub Actions" />
            </div>
        </div>

       
        <!-- Stack en juego -->
        <h2>🔥 EasyEngine + Nginx + Docker + Python + SSL + CI/CD con GitHub Actions + Bash</h2>

        <!-- Respuesta de FastAPI -->
        <pre class="response">{{ formattedResponse }}</pre>
    </div>
</template>

<style scoped>
/* Contenedor principal flexible */
.container {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    text-align: center;
    min-height: auto; /* Se ajusta al contenido */
    background-color: #1e1e1e;
    color: white;
    font-family: Arial, sans-serif;
    padding: 20px;
}

/* Logos distribuidos uniformemente */
.logos {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-evenly; /* Espaciado uniforme */
    gap: 15px;
    width: 100%;
    max-width: 500px; /* Limita el ancho máximo */
    margin-bottom: 15px;
}

.logos img {
    width: 50px;
    height: auto;
    filter: brightness(1.2);
}

/* Logo de GitHub con fondo blanco */
.github-icon {
    display: flex;
    align-items: center;
    justify-content: center;
    width: 50px;
    height: 50px;
    border-radius: 50%;
    background-color: white;
    padding: 5px;
}

.github-icon img {
    width: 40px;
    height: auto;
    filter: brightness(0); /* Asegura que se vea bien en cualquier fondo */
}

/* Títulos */
h1 {
    font-size: 1.8rem;
    margin-bottom: 10px;
}

h2 {
    font-size: 1.3rem;
    font-weight: normal;
    color: #cccccc;
    margin-bottom: 15px;
}

/* Respuesta API */
.response {
    background: #2d2d2d;
    padding: 10px;
    border-radius: 8px;
    font-size: 0.9rem;
    white-space: pre-wrap;
    word-wrap: break-word;
    max-width: 90%;
    overflow-x: auto;
    text-align: left;
    max-height: 200px; /* No se pasa de 200px en móvil */
    overflow-y: auto;
}

/* Ajustes responsivos */
@media (max-width: 600px) {
    .container {
        padding: 10px;
    }

    .logos {
        max-width: 80%; /* Se adapta mejor en móvil */
        gap: 10px;
    }

    .logos img {
        width: 40px;
    }

    .github-icon {
        width: 45px;
        height: 45px;
    }

    .github-icon img {
        width: 35px;
    }

    h1 {
        font-size: 1.6rem;
    }

    h2 {
        font-size: 1.1rem;
    }

    .response {
        font-size: 0.85rem;
    }
}
</style>

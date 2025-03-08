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
        <!-- Sección de Logos -->
        <div class="logos">
            <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/vuejs/vuejs-original.svg" alt="Vue" />
            <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/vite/vite-original.svg" alt="Vite" />
            <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/fastapi/fastapi-original.svg" alt="FastAPI" />
            <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/docker/docker-original.svg" alt="Docker" />
            <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/nginx/nginx-original.svg" alt="Nginx" />
            <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/python/python-original.svg" alt="Python" />
            <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/bash/bash-original.svg" alt="Bash" />
        </div>

        <!-- Título -->
        <h1>🚀 Vue + Vite con HTTPS y FastAPI</h1>

        <!-- Respuesta de FastAPI -->
        <h2>📡 FastAPI Response:</h2>
        <pre class="response">{{ formattedResponse }}</pre>
    </div>
</template>

<style scoped>
.container {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    text-align: center;
    height: 100vh;
    background-color: #1e1e1e;
    color: white;
    font-family: Arial, sans-serif;
    padding: 20px;
}

/* Logos */
.logos {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    gap: 15px;
    margin-bottom: 20px;
}

.logos img {
    width: 50px;
    height: auto;
    filter: brightness(1.2);
}

/* Estilos de Texto */
h1 {
    font-size: 2rem;
    margin-bottom: 10px;
}

h2 {
    font-size: 1.5rem;
    margin-bottom: 10px;
}

/* Respuesta API */
.response {
    background: #2d2d2d;
    padding: 15px;
    border-radius: 8px;
    font-size: 1rem;
    white-space: pre-wrap;
    word-wrap: break-word;
    max-width: 90%;
    overflow-x: auto;
    text-align: left;
}
</style>

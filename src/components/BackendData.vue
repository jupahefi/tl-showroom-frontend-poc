<script setup lang="ts">
import { ref, onMounted, computed } from "vue";
import axios from "axios";

interface ApiResponse {
    message?: string;
    error?: string;
}

const backendData = ref<ApiResponse | null>(null);
const reloadCount = ref(0);

const fetchData = async () => {
    try {
        const response = await axios.get<ApiResponse>("https://tl-showroom.equalitech.xyz/api/");
        console.log("✅ Respuesta del backend:", response);
        backendData.value = response.data;
        reloadCount.value++;
    } catch (error: any) {
        console.error("❌ Error al conectar con el backend:", error);
        backendData.value = {
            error: error.response
                ? `Error ${error.response.status}: ${error.response.statusText}`
                : "El backend no responde.",
        };
    }
};

onMounted(() => {
    fetchData();
    setInterval(fetchData, 10000);
});

const formattedResponse = computed(() =>
    backendData.value ? JSON.stringify(backendData.value, null, 2) : "Cargando..."
);
</script>

<template>
    <div class="container">
        <!-- Logos con enlaces -->
        <div class="logos">
            <a href="https://vuejs.org/" target="_blank"><img class="neon-border" src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/vuejs/vuejs-original.svg" alt="Vue.js" /></a>
            <a href="https://vitejs.dev/" target="_blank"><img class="neon-border" src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/vite/vite-original.svg" alt="Vite" /></a>
            <a href="https://fastapi.tiangolo.com/" target="_blank"><img class="neon-border" src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/fastapi/fastapi-original.svg" alt="FastAPI" /></a>
            <a href="https://www.docker.com/" target="_blank"><img class="neon-border" src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/docker/docker-original.svg" alt="Docker" /></a>
            <a href="https://nginx.org/" target="_blank"><img class="neon-border" src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/nginx/nginx-original.svg" alt="Nginx" /></a>
            <a href="https://www.python.org/" target="_blank"><img class="neon-border" src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/python/python-original.svg" alt="Python" /></a>
            <a href="https://www.gnu.org/software/bash/" target="_blank"><img class="neon-border" src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/bash/bash-original.svg" alt="Bash" /></a>
            <a href="https://github.com/features/actions" target="_blank">
                <div class="github-icon">
                    <img class="neon-border" src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/github/github-original.svg" alt="GitHub Actions" />
                </div>
            </a>
        </div>

        <!-- Contador de recargas -->
        <p class="reload-counter">🔄 Backend recargado: {{ reloadCount }} veces</p>

        <!-- Stack en juego -->
        <h2>🔥 EasyEngine + Nginx + Docker + Python + SSL + CI/CD con GitHub Actions + Bash</h2>

        <!-- Respuesta de FastAPI -->
        <pre class="response">{{ formattedResponse }}</pre>
    </div>
</template>

<style scoped>
/* Contenedor principal */
.container {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    text-align: center;
    min-height: auto;
    background-color: #1e1e1e;
    color: white;
    font-family: Arial, sans-serif;
    padding: 20px;
}

/* Logos distribuidos correctamente */
.logos {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    gap: 20px;
    width: 100%;
    max-width: 700px;
    margin-bottom: 15px;
}

.logos img {
    width: clamp(50px, 9vw, 100px);
    height: auto;
    transition: transform 0.3s ease, filter 0.3s ease;
}

/* Orilla blanca antes del efecto neón */
.neon-border {
    border-radius: 10px;
    background-color: white;
    padding: 5px;
    filter: drop-shadow(0px 0px 5px rgba(255, 255, 255, 0.8));
    transition: all 0.3s ease-in-out;
}

/* Neon en logos */
.neon-border:hover {
    filter: drop-shadow(0px 0px 10px rgba(255, 0, 255, 0.8));
}

/* GitHub alineado correctamente */
.github-icon {
    display: flex;
    align-items: center;
    justify-content: center;
    width: clamp(60px, 10vw, 110px);
    height: clamp(60px, 10vw, 110px);
    padding: 8px;
}

/* Respuesta API con efecto cristalizado */
.response {
    background: rgba(255, 255, 255, 0.1);
    backdrop-filter: blur(8px);
    padding: 15px;
    border-radius: 10px;
    font-size: 0.9rem;
    white-space: pre-wrap;
    word-wrap: break-word;
    max-width: 90%;
    overflow-x: auto;
    text-align: left;
    max-height: 200px;
    overflow-y: auto;
    border: 1px solid rgba(255, 255, 255, 0.2);
}

/* Ajustes responsivos */
@media (max-width: 600px) {
    .container {
        padding: 10px;
    }

    .logos {
        max-width: 90%;
        gap: 4vw;
    }

    h1 {
        font-size: 1.6rem;
    }

    h2 {
        font-size: 1.1rem;
    }
}
</style>

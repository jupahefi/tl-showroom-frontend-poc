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
        <!-- Respuesta de FastAPI -->
        <pre class="response">{{ formattedResponse }}</pre>

        <!-- Contador de recargas -->
        <p class="reload-counter">🔄 Backend recargado: {{ reloadCount }} veces</p>

        <!-- Logos con enlaces y neon glow -->
        <div class="logos">
            <a href="https://vuejs.org/" target="_blank"><div class="icon-box"><img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/vuejs/vuejs-original.svg" alt="Vue.js" /></div></a>
            <a href="https://vitejs.dev/" target="_blank"><div class="icon-box"><img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/vite/vite-original.svg" alt="Vite" /></div></a>
            <a href="https://fastapi.tiangolo.com/" target="_blank"><div class="icon-box"><img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/fastapi/fastapi-original.svg" alt="FastAPI" /></div></a>
            <a href="https://www.python.org/" target="_blank"><div class="icon-box"><img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/python/python-original.svg" alt="Python" /></div></a>
            <a href="https://www.javascript.com/" target="_blank"><div class="icon-box"><img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/javascript/javascript-original.svg" alt="JavaScript" /></div></a>
            <a href="https://www.postgresql.org/" target="_blank"><div class="icon-box"><img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/postgresql/postgresql-original.svg" alt="PostgreSQL" /></div></a>
            <a href="https://docs.docker.com/compose/" target="_blank"><div class="icon-box"><img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/docker/docker-original.svg" alt="Docker Compose" /></div></a>
            <a href="https://nginx.org/" target="_blank"><div class="icon-box"><img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/nginx/nginx-original.svg" alt="Nginx" /></div></a>
            <a href="https://www.gnu.org/software/bash/" target="_blank"><div class="icon-box"><img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/bash/bash-original.svg" alt="Bash" /></div></a>
            <a href="https://github.com/features/actions" target="_blank"><div class="icon-box"><img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/github/github-original.svg" alt="GitHub Actions" /></div></a>
            <a href="https://www.vultr.com/" target="_blank"><div class="icon-box"><img src="https://www.vultr.com/media/logo.svg" alt="Vultr" /></div></a>
            <a href="https://easyengine.io/" target="_blank"><div class="icon-box"><img src="https://avatars.githubusercontent.com/u/3853786?s=200&v=4" alt="EasyEngine" /></div></a>
        </div>
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
    margin-bottom: 10px;
}

/* Contador de recargas */
.reload-counter {
    font-size: 1.2rem;
    color: #ff9d00;
    margin: 10px 0 15px;
}

/* Logos con glow y bordes suaves */
.logos {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    gap: 20px;
    width: 100%;
    max-width: 800px;
    margin-top: 10px;
}

.icon-box {
    display: flex;
    align-items: center;
    justify-content: center;
    width: 70px;
    height: 70px;
    border-radius: 15px;
    background-color: white;
    padding: 5px;
    transition: transform 0.3s ease-in-out, filter 0.3s ease-in-out;
    filter: drop-shadow(0px 0px 5px rgba(255, 255, 255, 0.6));
}

/* Neon Glow alrededor */
.icon-box:hover {
    filter: drop-shadow(0px 0px 10px rgba(255, 0, 255, 0.8)) drop-shadow(0px 0px 15px rgba(255, 165, 0, 0.8));
    transform: scale(1.1);
}

.icon-box img {
    width: 50px;
    height: auto;
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

    .icon-box {
        width: 60px;
        height: 60px;
    }

    .icon-box img {
        width: 45px;
    }

    .response {
        font-size: 0.85rem;
    }

    .reload-counter {
        font-size: 1rem;
    }
}
</style>

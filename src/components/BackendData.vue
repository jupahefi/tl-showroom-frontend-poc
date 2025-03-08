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
        <!-- Título único con glow -->
      

        <!-- Logos -->
        <div class="logos">
            <img class="neon" src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/vuejs/vuejs-original.svg" alt="Vue.js" />
            <img class="neon" src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/vite/vite-original.svg" alt="Vite" />
            <img class="neon" src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/fastapi/fastapi-original.svg" alt="FastAPI" />
            <img class="neon" src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/docker/docker-original.svg" alt="Docker" />
            <img class="neon" src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/nginx/nginx-original.svg" alt="Nginx" />
            <img class="neon" src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/python/python-original.svg" alt="Python" />
            <img class="neon" src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/bash/bash-original.svg" alt="Bash" />
            <div class="github-icon">
                <img class="neon" src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/github/github-original.svg" alt="GitHub Actions" />
            </div>
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

/* Título con glow */
.animated-title {
    font-size: 2rem;
    padding: 10px 20px;
    color: white;
    text-shadow: 0 0 5px #ff9d00, 0 0 10px #ff4e00, 0 0 15px #e100ff;
    animation: neonText 1.5s infinite alternate ease-in-out;
}

@keyframes neonText {
    0% { text-shadow: 0 0 5px #ff9d00, 0 0 10px #ff4e00, 0 0 15px #e100ff; }
    50% { text-shadow: 0 0 10px #ff4e00, 0 0 20px #e100ff, 0 0 25px #ff9d00; }
    100% { text-shadow: 0 0 5px #e100ff, 0 0 10px #ff9d00, 0 0 15px #ff4e00; }
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

/* Neon en logos */
.neon {
    filter: drop-shadow(0px 0px 5px rgba(255, 0, 255, 0.6));
    animation: neonGlow 1.5s infinite alternate ease-in-out;
}

@keyframes neonGlow {
    0% { filter: drop-shadow(0px 0px 5px rgba(255, 0, 255, 0.6)); }
    50% { filter: drop-shadow(0px 0px 10px rgba(255, 165, 0, 0.8)); }
    100% { filter: drop-shadow(0px 0px 5px rgba(255, 255, 0, 0.6)); }
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

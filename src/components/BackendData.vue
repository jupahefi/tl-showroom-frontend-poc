<script setup lang="ts">
import { ref, onMounted, computed } from "vue";
import axios from "axios";

interface ApiResponse {
    message?: string;
    error?: string;
}

const backendData = ref<ApiResponse | null>(null);

onMounted(() => {
    fetchData();
    createStarryBackground();
});

const fetchData = async () => {
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
};

const formattedResponse = computed(() =>
    backendData.value ? JSON.stringify(backendData.value, null, 2) : "Cargando..."
);

const createStarryBackground = () => {
    const canvas = document.createElement("canvas");
    canvas.classList.add("star-canvas");
    document.body.appendChild(canvas);
    const ctx = canvas.getContext("2d") as CanvasRenderingContext2D;

    const resizeCanvas = () => {
        canvas.width = window.innerWidth;
        canvas.height = window.innerHeight;
    };
    window.addEventListener("resize", resizeCanvas);
    resizeCanvas();

    const stars: { x: number; y: number; size: number; speed: number }[] = [];
    for (let i = 0; i < 100; i++) {
        stars.push({
            x: Math.random() * canvas.width,
            y: Math.random() * canvas.height,
            size: Math.random() * 2,
            speed: Math.random() * 0.5 + 0.2,
        });
    }

    const animateStars = () => {
        ctx.clearRect(0, 0, canvas.width, canvas.height);
        ctx.fillStyle = "white";
        stars.forEach(star => {
            star.y += star.speed;
            if (star.y > canvas.height) {
                star.y = 0;
                star.x = Math.random() * canvas.width;
            }
            ctx.beginPath();
            ctx.arc(star.x, star.y, star.size, 0, Math.PI * 2);
            ctx.fill();
        });
        requestAnimationFrame(animateStars);
    };
    animateStars();
};
</script>

<template>
    <div class="container">
        <!-- Logos con enlaces -->
        <div class="logos">
            <a href="https://vuejs.org/" target="_blank" rel="noopener noreferrer">
                <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/vuejs/vuejs-original.svg" alt="Vue.js Framework" />
            </a>
            <a href="https://vitejs.dev/" target="_blank" rel="noopener noreferrer">
                <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/vite/vite-original.svg" alt="Vite Frontend Tooling" />
            </a>
            <a href="https://fastapi.tiangolo.com/" target="_blank" rel="noopener noreferrer">
                <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/fastapi/fastapi-original.svg" alt="FastAPI Backend Framework" />
            </a>
            <a href="https://www.docker.com/" target="_blank" rel="noopener noreferrer">
                <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/docker/docker-original.svg" alt="Docker Containerization" />
            </a>
            <a href="https://nginx.org/" target="_blank" rel="noopener noreferrer">
                <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/nginx/nginx-original.svg" alt="Nginx Web Server" />
            </a>
            <a href="https://ubuntu.com/" target="_blank" rel="noopener noreferrer">
                <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/ubuntu/ubuntu-plain.svg" alt="Ubuntu Linux OS" />
            </a>
        </div>

        <!-- Título principal -->
        <h1>🚀 Vue + Vite con HTTPS y FastAPI</h1>

        <!-- Stack en juego -->
        <h2>🔥 EasyEngine + Nginx + Docker + Docker Compose + Python + SSL + CI/CD con GitHub Actions + Bash + Ubuntu</h2>

        <!-- Respuesta de FastAPI -->
        <pre class="response">{{ formattedResponse }}</pre>
    </div>
</template>

<style scoped>
/* Fondo de estrellas */
.star-canvas {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    z-index: -1;
    background-color: black;
}

/* Contenedor principal */
.container {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    text-align: center;
    min-height: auto;
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
    max-width: 600px;
    margin-bottom: 15px;
}

.logos a {
    display: flex;
    align-items: center;
    justify-content: center;
    flex: 1 1 80px;
    max-width: 100px;
    transition: transform 0.2s ease-in-out;
}

.logos img {
    width: 100%;
    max-width: 80px;
    height: auto;
    filter: brightness(1.2);
}

.logos a:hover {
    transform: scale(1.1);
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
    background: rgba(0, 0, 0, 0.8);
    padding: 10px;
    border-radius: 8px;
    font-size: 0.9rem;
    white-space: pre-wrap;
    word-wrap: break-word;
    max-width: 90%;
    overflow-x: auto;
    text-align: left;
    max-height: 200px;
    overflow-y: auto;
}

/* Ajustes responsivos */
@media (max-width: 600px) {
    .container {
        padding: 10px;
    }

    .logos {
        max-width: 90%;
        gap: 10px;
    }

    .logos a {
        flex-basis: 60px;
        max-width: 70px;
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

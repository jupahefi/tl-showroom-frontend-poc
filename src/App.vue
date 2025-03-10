<script setup lang="ts">
import BackendData from "./components/BackendData.vue";
</script>

<template>
    <div class="container">
        <h1 class="glow-title">
            🚀 Vite+Vue y FastAPI con HTTPS
        </h1>
        <BackendData />
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
    min-height: 100vh;
    background-color: #1e1e1e;
    padding: 20px;
}

/* Glow aplicado al título */
.glow-title {
    font-size: clamp(2.5rem, 5vw, 4rem);
    text-align: center;
    color: white;
    text-shadow: 0 0 8px #ff9d00, 0 0 15px #ff4e00, 0 0 20px #e100ff;
    animation: neonGlow 1.5s infinite alternate ease-in-out;
    font-weight: bold;
    padding: 10px 0;
    display: flex;
    align-items: center;
    gap: 10px;
}

/* Imagen del emoji WebP */
.emoji {
    width: 50px;
    height: auto;
}

/* Animación Neon */
@keyframes neonGlow {
    0% { text-shadow: 0 0 8px #ff9d00, 0 0 15px #ff4e00, 0 0 20px #e100ff; }
    50% { text-shadow: 0 0 12px #ff4e00, 0 0 22px #e100ff, 0 0 28px #ff9d00; }
    100% { text-shadow: 0 0 8px #e100ff, 0 0 15px #ff9d00, 0 0 20px #ff4e00; }
}

/* Ajustes responsivos */
@media (max-width: 600px) {
    .glow-title {
        font-size: clamp(2rem, 6vw, 3rem);
    }
}
</style>

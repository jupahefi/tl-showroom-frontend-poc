<script setup lang="ts">
import BackendData from "./components/BackendData.vue";
</script>

<template>
    <div class="app-wrapper">
        <!-- Título con glow y emoji WebP -->
        <h1 class="glow-title">
            <img src="https://fonts.gstatic.com/s/e/notoemoji/15.1/1f680/512.webp" 
                alt="🚀" class="emoji" />
            Vite+Vue y FastAPI con HTTPS
        </h1>

        <!-- Componente que maneja la conexión con el backend -->
        <BackendData />
    </div>
</template>

<style scoped>
/* Envoltorio principal */
.app-wrapper {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: flex-start; /* Asegura que el contenido empiece arriba */
    text-align: center;
    min-height: 100vh;
    padding-top: 0; /* 🔥 Eliminamos el padding extra */
}

/* Glow aplicado al título */
.glow-title {
    font-size: clamp(2.5rem, 5vw, 4rem);
    color: white;
    text-shadow: 0 0 8px #ff9d00, 0 0 15px #ff4e00, 0 0 20px #e100ff;
    animation: neonGlow 1.5s infinite alternate ease-in-out;
    font-weight: bold;
    padding: 5px 0; /* 🔥 Reducimos el padding vertical */
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 5px; /* 🔥 Menos espacio entre emoji y texto */
}

/* Imagen del emoji WebP */
.emoji {
    width: clamp(40px, 4vw, 50px);
    height: auto;
    display: inline-block;
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
    .emoji {
        width: clamp(30px, 5vw, 40px);
    }
}
</style>

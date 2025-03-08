<script setup lang="ts">
import BackendData from "./components/BackendData.vue";
</script>

<template>
    <h1 class="glow-title">🚀 Vue + Vite con HTTPS y FastAPI</h1>
    <BackendData />
</template>

<style scoped>
/* Glow aplicado al título */
.glow-title {
    font-size: clamp(2.5rem, 5vw, 4rem); /* Ajuste dinámico según pantalla */
    text-align: center;
    color: white;
    text-shadow: 0 0 8px #ff9d00, 0 0 15px #ff4e00, 0 0 20px #e100ff;
    animation: neonGlow 1.5s infinite alternate ease-in-out;
    font-weight: bold;
    padding: 10px 0;
}

@keyframes neonGlow {
    0% { text-shadow: 0 0 8px #ff9d00, 0 0 15px #ff4e00, 0 0 20px #e100ff; }
    50% { text-shadow: 0 0 12px #ff4e00, 0 0 22px #e100ff, 0 0 28px #ff9d00; }
    100% { text-shadow: 0 0 8px #e100ff, 0 0 15px #ff9d00, 0 0 20px #ff4e00; }
}

/* Ajustes responsivos */
@media (max-width: 600px) {
    .glow-title {
        font-size: clamp(2rem, 6vw, 3rem); /* Más grande en móvil pero sin ser invasivo */
    }
}
</style>

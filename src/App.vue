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
    font-size: 2rem;
    text-align: center;
    color: white;
    text-shadow: 0 0 5px #ff9d00, 0 0 10px #ff4e00, 0 0 15px #e100ff;
    animation: neonGlow 1.5s infinite alternate ease-in-out;
}

@keyframes neonGlow {
    0% { text-shadow: 0 0 5px #ff9d00, 0 0 10px #ff4e00, 0 0 15px #e100ff; }
    50% { text-shadow: 0 0 10px #ff4e00, 0 0 20px #e100ff, 0 0 25px #ff9d00; }
    100% { text-shadow: 0 0 5px #e100ff, 0 0 10px #ff9d00, 0 0 15px #ff4e00; }
}
</style>

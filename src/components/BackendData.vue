<script setup lang="ts">
import { ref, onMounted } from "vue";
import axios from "axios";

interface ApiResponse {
    message?: string;
    error?: string;
}

const backendData = ref<ApiResponse | null>(null);

onMounted(async () => {
    try {
        const response = await axios.get<ApiResponse>("https://tl-showroom.equalitech.xyz/api/");
        
        console.log("✅ Respuesta completa del backend:", response);

        backendData.value = response.data;
    } catch (error: any) {
        console.error("❌ Error al conectar con el backend:", error);

        if (error.response) {
            console.error("⚠️ Respuesta del backend:", error.response.status, error.response.statusText);
            backendData.value = { 
                error: `Error ${error.response.status}: ${error.response.statusText}`
            };
        } else if (error.request) {
            console.error("🚫 El backend no respondió.");
            backendData.value = { error: "El backend no responde (Timeout o desconectado)." };
        } else {
            console.error("⚙️ Error en la configuración de la solicitud:", error.message);
            backendData.value = { error: "Error en la solicitud al backend." };
        }
    }
});
</script>

<template>
    <div>
        <h2>🚀 FastAPI Response:</h2>
        <pre>{{ backendData }}</pre>
    </div>
</template>

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
        const response = await axios.get<ApiResponse>("http://localhost:8000/");
        backendData.value = response.data;
    } catch (error: any) {
        console.error("❌ Error al conectar con el backend:", error);

        // Manejo detallado de errores
        if (error.response) {
            // El backend respondió con un código de estado distinto de 2xx
            console.error("⚠️ Respuesta del backend:", error.response.status, error.response.statusText);
            backendData.value = { 
                error: `Error ${error.response.status}: ${error.response.statusText}`
            };
        } else if (error.request) {
            // La solicitud fue hecha pero no hubo respuesta del backend
            console.error("🚫 El backend no respondió.");
            backendData.value = { error: "El backend no responde (Timeout o desconectado)." };
        } else {
            // Ocurrió un error en la configuración de la solicitud
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

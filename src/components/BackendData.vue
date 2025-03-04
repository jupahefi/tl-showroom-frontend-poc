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
        const response = await axios.get<ApiResponse>("/api/");
        backendData.value = response.data;
    } catch (error) {
        backendData.value = { error: "No se pudo conectar al backend" };
    }
});
</script>

<template>
    <div>
        <h2>🚀 FastAPI Response:</h2>
        <pre>{{ backendData }}</pre>
    </div>
</template>

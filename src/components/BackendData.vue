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

<script setup lang="ts">
import { ref } from 'vue'

defineProps<{ msg: string }>()

const count = ref(0)
</script>

<template>
  <h1>{{ msg }}</h1>

  <div class="card">
    <button type="button" @click="count++">count is {{ count }}</button>
    <p>
      Edit
      <code>components/HelloWorld.vue</code> to test HMR
    </p>
  </div>

  <p>
    Check out
    <a href="https://vuejs.org/guide/quick-start.html#local" target="_blank"
      >create-vue</a
    >, the official Vue + Vite starter
  </p>
  <p>
    Learn more about IDE Support for Vue in the
    <a
      href="https://vuejs.org/guide/scaling-up/tooling.html#ide-support"
      target="_blank"
      >Vue Docs Scaling up Guide</a
    >.
  </p>
  <p class="read-the-docs">Click on the Vite and Vue logos to learn more</p>
</template>

<style scoped>
.read-the-docs {
  color: #888;
}
</style>

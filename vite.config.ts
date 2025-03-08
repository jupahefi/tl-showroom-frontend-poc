import { defineConfig } from "vite";
import vue from "@vitejs/plugin-vue";

export default defineConfig({
    plugins: [vue()],
    server: {
        host: true,
        port: 5173,
        strictPort: true,
        proxy: {
            "/api": {
                target: "http://backend-tl-showroom.equalitech.xyz:8000",
                changeOrigin: true,
                secure: false,
                rewrite: (path) => path.replace(/^\/api/, ""),
            },
        },
    },
    build: {
        outDir: "dist"
    }
});

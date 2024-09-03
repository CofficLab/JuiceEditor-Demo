import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'

// https://vitejs.dev/config/
export default defineConfig({
  base: '/JuiceEditor-Demo/',  // 添加这一行
  plugins: [
    vue({
      template: {
        compilerOptions: {
          isCustomElement: tag => tag === 'juice-editor'
        }
      }
    })
  ]
})

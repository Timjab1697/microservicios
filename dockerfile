FROM node:20-alpine

# Carpeta de trabajo
WORKDIR /app

# Copiar package.json primero (mejor cache)
COPY package*.json ./

# Instalar dependencias
RUN npm ci --omit=dev

# Copiar el resto del código
COPY . .

# Puerto que usa Railway (importante usar variable PORT)
EXPOSE 3000

# Comando de inicio
CMD ["node", "hola.js"]
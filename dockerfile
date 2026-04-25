FROM node:20-alpine
RUN npm install --production
# Carpeta de trabajo
WORKDIR /app

# Copiar dependencias primero (mejor cache)
COPY package*.json ./

# Instalar dependencias
RUN npm ci --only=production

# Copiar el resto del código
COPY . .

# Puerto que usa Railway
EXPOSE 3000

# Comando de inicio (IMPORTANTE)
CMD ["node", "hola.js"]
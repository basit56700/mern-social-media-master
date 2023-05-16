# Base image (get node image)
FROM node:14  

# Create app directory
WORKDIR /app

# Install app dependencies for client
COPY client/package*.json ./client/
RUN cd client && npm install

# Install app dependencies for server
COPY server/package*.json ./server/
RUN cd server && npm install

# Bundle app source
COPY . .

# Build client
RUN cd client && npm run build

# Expose port
EXPOSE 8080

# Start the server
CMD ["npm", "start"]

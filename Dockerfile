# Use an official Node.js runtime as a parent image
FROM node:14-alpine

# Set the working directory to /app
WORKDIR /app

# Copy the package.json files for the client and server
COPY client/package*.json ./client/
COPY server/package*.json ./server/

# Install dependencies for the client and server
RUN cd client && npm install
RUN cd ../server && npm install

# Copy the client and server code to the container
COPY client ./client
COPY server ./server

# Expose port 3000 for the client and 5000 for the server
EXPOSE 3000 5000

# Start the client and server
CMD cd server && npm start & cd ../client && npm start

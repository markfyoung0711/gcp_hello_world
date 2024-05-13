# Define the build stage
FROM node:16-alpine as build

# Set the working directory in the Docker image
WORKDIR /app

# Copy package.json and package-lock.json to Docker image
COPY package.json package-lock.json ./

# Install dependencies in the image
RUN npm install

# Copy the rest of your React app source code to the Docker image
COPY . .

# Build your React application
RUN npm run build

# Define the serve stage
FROM nginx:alpine

# Copy static assets from build stage to Nginx serve directory
COPY --from=build /app/build /usr/share/nginx/html

# Expose port 80 to the outside world
EXPOSE 80

# Start Nginx and keep it running in the foreground
CMD ["nginx", "-g", "daemon off;"]

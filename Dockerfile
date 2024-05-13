# Use a base image with Python 3.11 and Node.js (latest version)
FROM nikolaik/python-nodejs:python3.12-nodejs22-slim

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package.json package-lock.json ./

# Install Node.js dependencies
RUN npm install

# Copy Python requirements file to the working directory
COPY requirements.txt .

# Install Python dependencies
RUN pip install -r requirements.txt

# Install React dependencies (if needed)
# RUN npm install react react-dom

# Copy the rest of the application files to the working directory
COPY . .

# Expose the port your app runs on
EXPOSE 3000

# Command to run the application
CMD ["npm", "start"]

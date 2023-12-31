# Use an official Node runtime as a parent image
FROM node:14

# Install necessary libraries
RUN apt-get update && apt-get install -y libnss3

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install app dependencies
RUN npm install

# Copy the rest of the application code to the working directory
COPY . .

# Expose port 3000 to the outside world
EXPOSE 3000

# Run npm start when the container launches
CMD ["npm", "start"]

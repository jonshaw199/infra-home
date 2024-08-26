# Use an official Node.js image as the base
FROM node:latest

RUN apt-get update && apt-get install -y git

# Set the working directory
WORKDIR /app

RUN git clone https://github.com/jonshaw199/shaw-family.git

# Set the new working directory
WORKDIR /app/shaw-family

# Install dependencies
RUN npm install

# Build the application
RUN npm run build

# Start the Next.js server
CMD ["npm", "run", "start"]

# Expose port 3000
EXPOSE 3000
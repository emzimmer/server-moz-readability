# Generated by https://smithery.ai. See: https://smithery.ai/docs/config#dockerfile
# Use the official Node.js image
FROM node:18-alpine AS build

# Set the working directory
WORKDIR /app

# Copy the package.json and package-lock.json to the working directory
COPY package.json /app/

# Install project dependencies
RUN npm install

# Copy the project files into the Docker image
COPY . .

# Build the project (if there is any build step, in this case, there's none explicitly mentioned)
# RUN npm run build 

# Use a minimal Node.js image for production
FROM node:18-alpine AS production

# Set the working directory
WORKDIR /app

# Copy the built files and node_modules from the build stage
COPY --from=build /app /app

# Expose the port that the app runs on (if applicable)
# EXPOSE 3000

# Command to run the MCP server
CMD ["node", "dist/index.js"]

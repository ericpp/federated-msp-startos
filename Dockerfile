# Build the code using the smaller node:16-alpine image from Docker Hub
FROM node:16-alpine as build

# Set the working directory
WORKDIR /usr/src/app/msp

# Copy all your code into the working directory
COPY msp-studio .

# Copy our custom StartOS dockerStart script
COPY dockerStart.js .

# Install dependencies and yaml for dockerStart script
RUN npm install && npm install yaml

# Install server dependencies
RUN cd server && npm install

# Build the SvelteKit app
RUN npm run build

###

# Bundle the code with a clean node:16-alpine image
# and copy the code without build artifacts
FROM node:16-alpine

# Reset working directory
WORKDIR /usr/src/app/msp

# Install PM2
RUN npm install -g pm2 && rm -rf /root/.npm

# Copy built code from previous build stage
COPY --from=build /usr/src/app/msp .

# Copy docker_entrypoint.sh and make it executable
COPY docker_entrypoint.sh /usr/local/bin/docker_entrypoint.sh
RUN chmod a+x /usr/local/bin/docker_entrypoint.sh

# Expose http port
EXPOSE 8000

# Use dockerStart script as the entry point
ENTRYPOINT ["/usr/local/bin/docker_entrypoint.sh"]
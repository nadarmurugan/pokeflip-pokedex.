# 1. Base Image
# Uses Alpine Linux for a tiny footprint (~5MB), which is a DevOps best practice.
FROM nginx:alpine

# 2. Custom Configuration Injection
# We overwrite the default Nginx config with your professional 'nginx.conf'.
# This enables the Gzip, Security Headers, and Caching you defined earlier.
COPY nginx.conf /etc/nginx/nginx.conf

# 3. Static Asset Deployment
# Copies your optimized PokéFlip HTML into the Nginx serving directory.
# In production, you would also copy your CSS/JS folders here if they were separate.
COPY index.html /usr/share/nginx/html/index.html

# 4. Port Documentation
# Signals that this container is designed to be accessed via port 80.
EXPOSE 80

# 5. Execution Logic (CMD)
# ["nginx"]         -> The web server executable.
# ["-g"]            -> Global directive flag to pass configuration.
# ["daemon off;"]   -> Keeps Nginx in the foreground so the Docker container 
#                      doesn't exit immediately after starting.
CMD ["nginx", "-g", "daemon off;"]

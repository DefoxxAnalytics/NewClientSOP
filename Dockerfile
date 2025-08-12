# Dockerfile for Versatex SOP Platform
FROM nginx:alpine

# Set working directory
WORKDIR /usr/share/nginx/html

# Remove default nginx website
RUN rm -rf /usr/share/nginx/html/*

# Copy the SOP platform files
COPY index.html .
COPY vtx_logo_black.png .
COPY vtx_logo_white.png .
COPY README.md .
COPY CLAUDE.md .

# Create appendices directory structure
RUN mkdir -p appendices/data-mapping \
    appendices/taxonomies \
    appendices/powerbi \
    appendices/quality \
    appendices/communication \
    appendices/technical

# Copy appendices if they exist (will be mounted as volume in production)
COPY appendices/ ./appendices/ 2>/dev/null || :

# Configure nginx for single-page application
RUN echo 'server { \
    listen 80; \
    server_name localhost; \
    root /usr/share/nginx/html; \
    index index.html; \
    location / { \
        try_files $uri $uri/ /index.html; \
    } \
    location ~* \.(js|css|png|jpg|jpeg|gif|ico|svg)$ { \
        expires 1y; \
        add_header Cache-Control "public, immutable"; \
    } \
}' > /etc/nginx/conf.d/default.conf

# Expose port 80
EXPOSE 80

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD wget --no-verbose --tries=1 --spider http://localhost/ || exit 1

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
# docker build -t kazeemakinrinde/ngcloak:latest .

FROM quay.io/keycloak/keycloak:latest

# Set Keycloak to run in "quarkus" mode
ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin
ENV KC_HEALTH_ENABLED=true
ENV KC_METRICS_ENABLED=true
ENV KC_DB=postgres
ENV KC_DB_URL=jdbc:postgresql://dpg-cuu5ag1opnds739t6gs0-a.oregon-postgres.render.com/bluepay_db
ENV KC_DB_USERNAME=techrunch
ENV KC_DB_PASSWORD=ZfNqijcx0TcRIopJ5f46VNYxPZBaVFtZ

# Add custom theme
COPY themes /opt/keycloak/themes

# Start Keycloak
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start-dev", "--hostname-strict=false"]

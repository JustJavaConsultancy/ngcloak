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

ENV KC_SPI_EVENTS_LISTENER_ACCOUNT_LOCK_LISTENER_SERVERURL=https://ngcloak.onrender.com
ENV KC_SPI_EVENTS_LISTENER_ACCOUNT_LOCK_LISTENER_CLIENTID=admin-client
ENV KC_SPI_EVENTS_LISTENER_ACCOUNT_LOCK_LISTENER_CLIENTSECRET=Q9G8MRU3WRcIyw4prqVZeD2YNljvNFAh

# Add custom theme
COPY themes /opt/keycloak/themes
COPY providers /opt/keycloak/providers

# Start Keycloak
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start", "--hostname-strict=false", "--proxy-headers=xforwarded"]

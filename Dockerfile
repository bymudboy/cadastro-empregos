# Usa imagem oficial do WildFly 14
FROM jboss/wildfly:14.0.1.Final

# Remove apps padrão
RUN rm -rf /opt/jboss/wildfly/standalone/deployments/*

# Copia seu .war para a pasta de deploy do WildFly
COPY build/empregos.war /opt/jboss/wildfly/standalone/deployments/ROOT.war

# Exponha a porta padrão do WildFly
EXPOSE 8080

# Usa imagem oficial do WildFly 14
FROM jboss/wildfly:14.0.1.Final

# Remove apps padrão
RUN rm -rf /opt/jboss/wildfly/standalone/deployments/*

# Copia seu .war para a pasta de deploy do WildFly
COPY build/empregos.war /opt/jboss/wildfly/standalone/deployments/ROOT.war

# Copia o standalone.xml modificado para dentro do WildFly
COPY standalone.xml /opt/jboss/wildfly/standalone/configuration/standalone.xml

# Exponha a porta padrão do WildFly
ENV PORT 8080
EXPOSE 8080

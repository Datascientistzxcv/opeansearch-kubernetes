ARG VERSION=2.0.1
FROM opensearchproject/opensearch
ARG ACCOUNT_NAME
ARG ACCOUNT_KEY


# Install Plugins
RUN opensearch-plugin install repository-azure --verbose --batch

# Setting up the Azure storage Setting 
RUN /usr/share/opensearch/bin/opensearch-keystore create
RUN echo ${ACCOUNT_NAME} | /usr/share/opensearch/bin/opensearch-keystore add --stdin azure.client.default.account
RUN echo ${ACCOUNT_KEY} | /usr/share/opensearch/bin/opensearch-keystore add --stdin azure.client.default.key
RUN echo ${ACCOUNT_NAME} ${ACCOUNT_KEY} > /usr/share/opensearch/secrets
# L'image node:18-alpine est une image légère de Node.js basée sur Alpine Linux
FROM node:18-alpine

# Creation du dossier de app
WORKDIR /usr/src/app

# On utilise --chown=node:node pour s'assurer que les fichiers appartiennent à l'utilisateur node
COPY --chown=node:node package*.json ./

# Installation des dépendances listées dans package.json
# "ci" veut dire "clean install" et est similaire à npm install, sauf qu'il supprime le répertoire node_modules, puis réinstalle les dépendances. Cela garantit que le répertoire node_modules soit le plus optimisé
RUN npm ci

# Copie de tous les fichiers du répertoire actuel vers le répertoire de travail (/usr/src/app) dans l'image
COPY --chown=node:node . .

# Lance la commande de build qui crée le bundle de production
RUN npm run build

# L'environnement de production est utilisé pour exécuter l'application en production
ENV NODE_ENV production

# `npm ci` supprime le répertoire node_modules existant et l paramètre --only=production garantit que seules les dépendances de production sont installées. Cela garantit que le répertoire node_modules soit le plus optimisé
RUN npm ci --only=production && npm cache clean --force

# Utilise l'utilisateur "node" de l'image (au lieu de l'utilisateur root)
USER node

# Lance le serveur en utilisant le build de production
CMD [ "node", "dist/main.js" ]
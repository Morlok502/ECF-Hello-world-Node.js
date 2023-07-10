# Activité Type 2 : Déploiement d’une application en continu

## 1. Créez une application Nodejs (hello word) à partir d’une image docker Nodejs que vous exposerez sur un port (de votre choix) (1 point).

Choix du Framework : NestJS  

### 1.1 Installation de nodeJS, npm et nestJS 

- On peut installer nodeJS en utilisant le gestionnaire de paquets apt.  
Il faut commencer par mettre à jour l'index du dépot, puis installer le paquet nodejs
  ``` 
  sudo apt update
  sudo apt install nodejs
  ```  
- Tester la version installée de nodeJS.  
  Remarque : la version 16, ou supérieure est nécessaire pour nesJS
  ``` 
  node -v
  ```  
  ![](img/image.png)  
- Installer le gestionnaire de paquets de nodejs : npm
  ```
  sudo apt install npm
  ```
- Installer nestjs à l'aide de npm 
  ```
  npm install -g @nestjs/cli
  ```
### 1.2 Initialisation d'un projet nestJS

- Initialisation d'un nouveau projet. Remplacer `project-name` par ne nom du projet  
  ```
  nest new project-name
  ```
  ![](img/image1.png)
- Une fois le projet initialisé, on peut lancer l'application  
  ```
  npm run start
  ```
  ![](img/image2.png)

### 1.3 Test de l'application

Le port d'écoute par défaut est le port 3000 (information visible dans **dist/main.js** : ` await app.listen(3000)`)

On ouvre un navigateur sur l'adresse `localhost:3000` et on constate que l'application fonctionne :  
![](img/image3.png)  

## 2. Dockerizez votre application Nodejs (2 points).


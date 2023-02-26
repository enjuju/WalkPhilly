# WalkPhilly Mobile Web App

---
<div align="center">
<img src="https://github.com/devicons/devicon/blob/master/icons/java/java-original-wordmark.svg" alt="Java" width="50" height="50"/>
<img src="https://github.com/devicons/devicon/blob/master/icons/html5/html5-original.svg" alt="HTML" width="50" height="50"/>
<img src="https://github.com/devicons/devicon/blob/master/icons/css3/css3-plain-wordmark.svg" alt="CSS" width="50" height="50"/>
<img src="https://github.com/devicons/devicon/blob/master/icons/javascript/javascript-original.svg" alt="JavaScript" width="50" height="50"/>
<img src="https://github.com/devicons/devicon/blob/master/icons/vuejs/vuejs-original-wordmark.svg" alt="VueJS" width="50" height="50"/>
<img src="https://github.com/devicons/devicon/blob/master/icons/postgresql/postgresql-original-wordmark.svg" alt="PostgreSQL" width="50" height="50"/>
</div>

---





## Co-authors


<table>
  <tr>
    <td align="center"><a href="https://github.com/enjuju"><img src="https://avatars.githubusercontent.com/u/105042739?v=4" width="100px;" alt=""/><br /><sub><b>Patricia Kamlley</b></sub></a></td>
    <td align="center"><a href="https://github.com/D-Duque"><img src="https://avatars.githubusercontent.com/u/117413139?v=4" width="100px;" alt=""/><br /><sub><b>Daniel Duque</b></sub></a></td>
    <td align="center"><a href="https://github.com/honglebs"><img src="https://avatars.githubusercontent.com/u/101665760?v=4" width="100px;" alt=""/><br /><sub><b>Hong Le</b></sub></a></td>
    <td align="center"><a href="https://github.com/emmascode"><img src="https://avatars.githubusercontent.com/u/117713421?v=4" width="100px;" alt=""/><br /><sub><b>John Mullen</b></sub></a></td>
  </tr>
</table>

---
<--Insert Preview Here-->

---

# Install

```
git clone https://github.com/enjuju/WalkPhilly.git
```

# Usage
to run this script

Inside the /database/ directory you will find an executable Bash script (.sh file)

To run:
```console
cd <project-root>/database/ chmod u+r+x create_capstone-db.sh ./create_capstone-db.sh
```
above ^ works on MacOS

using Ubuntu you can run this by doing a

```sh
sh ./create_capstone-db.sh
```

# After database population

Start the java server

```console
cd <project-root>/application-server/
javac application-server
java application-server
```

# After server is started

```console
cd <project-root>/vue/
npm install
npm run serve
```
Now you can interact with this full stack application

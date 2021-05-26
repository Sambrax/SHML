# SHML

ShellScript Hypertext Markup Language - Generates dynamic HTML content via ShellScript. 

## **INSTALL**

Requirements: **FCGI Wrap, Web Server (Apache2 | Nginx)**

### _LINUX_ (Debian)

**FCGI Wrap**

_debian@debian:~$_ **su**

_root@debian:~#_ **apt install fcgiwrap**

**Apache2 Modules**

_debian@debian:~$_ **su -**

_root@debian:~#_ **a2enmod rewrite**

_root@debian:~#_ **a2enmod proxy_fcgi**

_root@debian:~#_ **/etc/init.d/apache2 restart**

---

**SHML**

Download - [install.sh](https://raw.githubusercontent.com/Renexo-git/SHML/master/install.sh)

_root@debian:~#_ **sh install.sh**

---

![ScreenShot](https://raw.githubusercontent.com/Renexo-git/SHML/master/01.png)

![ScreenShot](https://raw.githubusercontent.com/Renexo-git/SHML/master/02.png)

![ScreenShot](https://raw.githubusercontent.com/Renexo-git/SHML/master/03.png)

![ScreenShot](https://raw.githubusercontent.com/Renexo-git/SHML/master/04.png)

---

- Your shell functions must be declared or included in the file: **/usr/share/shml/library.sh**

- Place the index.shml file in the public directory of the web server.

---

**index.shml**

```html
<!DOCTYPE html>
<html>
<head>
<title>SHML <% version() %></title>
</head>
<body>
<!--

Block comment...

-->
<h1>It worked! <% print("Welcome!") %></h1>
<!-- Inline comment -->
<hr>
<h2><% hello_world() %></h2>
<h3><% date(%Y-%m-%d) %></h3>
</body>
</html>
```
### Output

![ScreenShot](https://raw.githubusercontent.com/Renexo-git/SHML/master/05.png)

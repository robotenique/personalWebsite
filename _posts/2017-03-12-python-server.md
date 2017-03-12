---
layout: post
title:  "Fast and easy Python LAN server"
date:   2017-03-12
desc: "How to create a LAN server in one line of code"
keywords: "python,programming,cs"
categories: [Computer Science, Python]
tags: [python,programming]
icon:  fa-server

---
![pythonLO]({{ site.img_path }}/pytServer/pythonLO.png){: .center-image }


This is a very simple tip, but it's very useful when you want others to access your files, or you want to transfer files easily.
Just open the terminal, navigate to the folder you want to serve, and then type
~~~bash
$ python -m SimpleHTTPServer
~~~
The server will be created in the IP of your machine.

To find your IP, type
~~~bash
$ ifconfig -all
~~~
or
~~~bash
$ ip a
~~~

If you're using Python 3.x, you should instead open the server with
~~~bash
$ python -m http.server
~~~

Your files will be displayed when you access the website using your IP, so you can access it from other machines in the network. Here's an example of what you'll see:

![exp]({{ site.img_path }}/pytServer/exp.png){: .center-image }

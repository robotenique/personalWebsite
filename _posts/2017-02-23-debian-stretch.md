---
layout: post
title:  "Debian Stretch setup"
date:   2017-02-23
desc: "My Debiankjlkj Stretch setup"
keywords: "linux,debian,setup"
categories: [Linux, Misc]
tags: [debian,installation,setup,environment]
icon: fa-magic
---

Hello! In this post, I'll show how is the setup that I use, the most common applications I mostly use when programming, some useful plugins, anyway, my complete programming environment. I'll first cover my OS setup, then the applications and finally the customizations. Feel free to contact me if there's any doubt, but I'll try to be clear and concise.

## Summary
---


## The setup
I use a dualboot with *debian* and *Windows 10*. In this post my focus is in my the linux environment, which is a Debian 9 (Stretch), with the GNOME 3.22 desktop environment, and some customizations in the theme. You can see below my desktop in the screenshot.

![mySetup]({{ site.img_path }}/debianSetup/mysetup.png){: .center-image }

### **OS Installation**

I installed *Debian Stretch* from the official Debian website, using the *netinst* version with the *amd64* architecture. **Important:** to use the *netinst* version, you need to have internet connection because the *netinst* version downloads a lot of things in the setup. You can [click here](https://www.debian.org/devel/debian-installer/index.en.html) to access the official Debian download page.

The installation itself is pretty straightforward. In the desktop environment section select the *GNOME* environment.

![install]({{ site.img_path }}/debianSetup/debianinstall.png){: .center-image }


### **Updating GRUB**

After the installation is complete, there are some things you need to take of. First of all, if you have (like myself) another HDD partition with Windows or another OS, I suggest updating [GRUB](http://www.golinuxhub.com/2014/03/what-is-grub-boot-loader.html), by opening the *terminal* and running the following command **as root** (use *su* to access the *root* user):

**$** update-grub

This will generate a GRUB configuration file with the OS installed in your machine. If this didn't worked, you could also try to run *update-grub2*.

![updgrub]({{ site.img_path }}/debianSetup/grubupd.png){: .center-image }

### **Use SUDO**

Debian by default doesn't add your user to the *sudo* group, to make use of the *sudo* functionality (which I recommend), type this in your terminal (as root), replacing *juliano* with your actual username:

**$** usermod -a -G sudo juliano
Now, whenever you need to do something as *root*, you can just run with the *sudo* keyword before the actual command. It's [safer](http://askubuntu.com/questions/135428/what-are-the-benefits-of-sudo-over-su/135429) than using *su*, and much more convenient.

### **Set keyboard shortcuts**

IN GNOME 3.22 the keyboard shortcuts section changed, and now it's easier to navigate. Go to Settings (Press *Super/Windows* key, then type 'settings'), go to 'Keyboard', and explore the shortcut list. Personally I recommend checking the shortcuts for changing workspace, managing a window size / position and setting the shortcut for "Hide all normal Windows". To add a new shortcut just go to the end of the list then click the '+' symbol.

One custom shortcut with I find very useful is to open the terminal. Just set it up like the screenshot below, and you're good to go.

![shortcut]({{ site.img_path }}/debianSetup/tshortcut.png){: .center-image }

### **Add Source list**

To use the *apt* with most common applications, you need to edit the sources.list file, and add some new repository URLs to it. Open */etc/apt/sources.list* with *gedit* (or *nano*, *vi*, etc), and add some basic info about the repositories. I suggest checking [this website](https://debgen.simplylinux.ch/) which generates a sources.list file automatically based on your location, or you could just add the *contrib* and *non-free* tags at the end of each repository URL.

You can check my *sources.list* until this point of the configuration (we'll add more things later):

![sourcesL]({{ site.img_path }}/debianSetup/sourcesL.png){: .center-image }

After you need to update the repository in *apt*, so run these commands:

**$** sudo apt-get update

**$** sudo apt-get upgrade

### **Install applications**

Now that the repositories are configured, you can install some common applications in the PC using the *apt* tool. You can *apt-get install* most of the apps you need, for example, to install *Google Chrome* run **$** *sudo apt-get install chrome*, and so on. But there are some other software which you need to download and install manually, but you can do it easily with [dpkg](http://askubuntu.com/questions/40779/how-do-i-install-a-deb-file-via-the-command-line) (if it's a .deb file).

Some applications I installed were [Telegram](https://telegram.org/), [Discord](https://discordapp.com/), [Chrome](https://www.google.com/chrome/browser/desktop/index.html), [Vlc](http://www.videolan.org/vlc/index.html), [Sublime Text](https://www.sublimetext.com/3) and [Git](https://git-scm.com/).

I had a nasty problem installing *steam* in the Stretch version, but it finally worked out. I installed some missing libraries (initially the problem was "You are missing the following 32-bit libraries, and Steam may not run: libc.so.6"), and added a PRELOAD variable every time I run Steam, and it works like a charm.

---

## Terminal

In my terminal, I use ZSH instead of *bash*, with the *oh-my-zsh* framework. Below is a screenshot of my terminal:

![myterminal]({{ site.img_path }}/debianSetup/myterminal.png){: .center-image }

First of all, you need to install the ZSH, and then the framework itself. Just follow the tutorials for installing [ZSH](https://github.com/robbyrussell/oh-my-zsh/wiki/Installing-ZSH) and [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh).

After you installed everything, you can customize your theme and add *aliases* in the *~/.zshrc* file.

If you want something similar to my theme, you need to install the [powerlevel9k](https://github.com/bhilburn/powerlevel9k) theme. Also, you need to install custom fonts to display the icons properly. The dependencies of the fonts you'll need are [awesome-terminal-fonts](https://github.com/gabrielelana/awesome-terminal-fonts) and [Powerline fonts](https://github.com/powerline/fonts).

In the terminal (Gnome terminal) you can change the fonts, configure the color schemes and configure some minor features. For the theme to work properly, you need to modify your "~/.zshrc" file and add the information of the powerlevel9k theme. You can check [my *.zshrc*](https://github.com/robotenique/RandomAccessMemory/blob/master/infofiles/.zshrc) for hints and a model of what you could include in yours.


Oh-my-zsh is one of the best frameworks for the Linux shell, it can increase your productivity and make things simpler, by using a variety of plugins and built-in functionality. The tab completion is much more powerful than the default bash, and much easier and intuitive to use. I recommend to check the plugins in the Oh-my-zsh [page](https://github.com/robbyrussell/oh-my-zsh/wiki/Plugins). I use the *git* plugin and the *global/local history* plugin. Finally, another good built-in feature of Oh-my-zsh is their aliases. Run *alias* in the terminal, and see all the aliases predefined by the framework, especially those about *git* cause they make things much more easier to do.

![gst]({{ site.img_path }}/debianSetup/gitstatus.png){: .center-image }

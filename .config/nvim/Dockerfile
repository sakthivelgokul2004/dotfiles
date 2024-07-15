# Use the official Arch Linux base image
FROM  archlinux


#Update package repositories and install necessary packages
RUN   pacman -Sy git gcc neovim --noconfirm

RUN cd ~ && mkdir .config

RUN cd ~ &&  git clone https://github.com/Sakthivelgokul/dotfile.git

RUN cd ~/dotfile && cp -r . ~/.config/nvim





#!/usr/bin/env bash

# Script for making dotfiles compatible for stow

for d in */ ; do
	[ ! -d $d/.config/$d ] && mkdir -pv $d/.config/$d
	mv -fv $d/* $d/.config/$d
done

# move [dot]files in zsh
for f in zsh/.* ; do
	mv -fv $f zsh/.config/zsh/
done

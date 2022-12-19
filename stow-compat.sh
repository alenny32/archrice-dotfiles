#!/usr/bin/env bash

# Script for making dotfiles compatible for stow

for d in */ ; do
	[ ! -d $d/.config/$d ] && mkdir -pv $d/.config/$d
	mv -fv $d/* $d/.config/$d
done

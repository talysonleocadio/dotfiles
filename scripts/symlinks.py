#!/usr/bin/env python

import os
import glob

homePath = os.environ['HOME']
fileSources = os.path.join(homePath, '.dotfiles')

def sourcePath(subPath):
    return os.path.join(fileSources, subPath)

def destPath(subPath):
    return homePath if subPath == 'home' else os.path.join(homePath, subPath)

def absolutePaths(predicate, paths):
    return map(predicate, paths)

sourceSubPaths = [
    'tmux/.tmux.conf',
    'vscode/settings/*',
    'zsh/.zshrc',
    'ripgrep/.ripgreprc'
]

destSubPaths = [
    'home',
    '.config/Code/User',
    'home',
    'home'
]

sourcePaths = absolutePaths(sourcePath, sourceSubPaths)
destPaths = absolutePaths(destPath, destSubPaths)

symlinkPaths = zip(sourcePaths, destPaths)

for paths in symlinkPaths:
    [source, dest] = [paths[0], paths[1]]
    print('Criando symlink de %s para %s' %(source, dest))
    for files in glob.glob(source):
        os.symlink(source, dest)


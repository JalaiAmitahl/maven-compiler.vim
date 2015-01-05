# Maven Compiler Setup for VIM

A pathogen installable module for VIM which readies VIM to be used as a Java development environment using the Maven build / dependency management system from Apache.

## Installation

The Maven compiler setup can be installed in a few ways.  The preferred method is by using [Pathogen](https://github.com/tpope/vim-pathogen), but it can also be installed by unzipping the package to your ~/.vim/ directory.

### Pathogen

To install using the Pathogen vim script do the following:
```
git clone https://github.com/JalaiAmitahl/maven-compiler.vim ~/.vim/bundle/
```

### Copy / Move

To install using the copy / move method, do the following in any directory:

```bash
if [ ! -d "~/.vim/ftdetect"]; then
    mkdir ~/.vim/ftdetect
fi
if [ ! -d "~/.vim/compiler"]; then
    mkdir ~/.vim/compiler
fi
if [ ! -d "~/.vim/syntax"]; then
    mkdir ~/.vim/syntax
fi
git clone https://github.com/JalaiAmitahl/maven-compiler.vim
cp maven-compiler.vim/ftdetect/* ~/.vim/ftdetect/
cp maven-compiler.vim/compiler/* ~/.vim/compiler/
cp maven-compiler.vim/syntax/* ~/.vim/syntax/
```

## Contents

As a VIM module, this package contains the following:

1. A syntax file containing highlighting rules for Maven's pom.xml files.
1. A compiler file containing the compiler setup and error format setup.
1. A file type detection script for pom.xml files to setup the filetype and syntax type for pom editing.
1. A plugin to sort the quick fix list and strip duplicate and blank entries.

## Component Notes

### Syntax Script

* The syntax file currently hand codes / matches the full Maven POM notes.
* There are likely some tags which are handled in the proper Maven XSD that I have missed at this time.  I will rectify that soon-ish.
* To manually use the syntax script on a file not identified as a pom file:
    ` :set syntax=pom`

### Compiler Script

* The compiler script catches and tosses plenty of information.  This may be tweaked in the future.
* The build result line will be displayed.
* The quick fix window does not open by default.  I need to determine how to fix this.
* To manually use the compiler on a java or pom.xml file:

    ` :compiler mvn`

* To use auto command to set the compiler any time a pom or java file is opened (assuming the pom ftdetect script is used):

    ```
    autocommand Filetype java compiler mvn
    autocommand Filetype pom compiler mvn
    ```

### File type detection script

* The file detection script is to auto-detect the pom.xml file type and set the filetype and syntax values to *pom*

### Quick fix sort plugin

This script is based off of the script found here: [Automatically Sort Quickfix List for VIM](http://vim.wikia.com/wiki/Automatically_sort_Quickfix_list).

Modifications:
1. Strip out any entries which don't have a text value.


## Additional Info

Originally the compiler script set a few mappings, but these have been removed in the interest of not futzing with users settings. I now use autocmd to set the following on java file types:

- autocmd Filetype java no &lt;F2&gt; :make clean package&lt;CR&gt;
- autocmd Filetype java no &lt;S-F2&gt; :make clean package site site:stage&lt;CR&gt;
- autocmd Filetype java no &lt;C-F2&gt; :make clean&lt;CR&gt;
- autocmd Filetype java no &lt;F3&gt; :make 
- autocmd Filetype java no &lt;S-F3&gt; :make clean deploy site site:stage site:deploy&lt;CR&gt;

## License

Copyright (c) Dan Taylor. Distributed under the same terms as Vim itself.

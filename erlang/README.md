# Table of Contents

1. [Installation](#erlang-installation)
2. [Simple Compilation](#erlang-compilation)







# Installation<a name="erlang-installation" ></a>

```bash
# update base
sudo apt-get update

# add repository entry
# repository from official website
wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb
sudo dpkg -i erlang-solutions_1.0_all.deb

# again update
sudo apt-get update
sudo apt-get install erlang # install erlang, press Y and enter
```





# Simple compilation<a name="erlang-compilation"></a>

1. `-module(moduleName).` , with the module name same as the file name
   1. this can be thought of as `package moduleName`  in JAVA.
2. just like how `;` is used to end every line in `c++/java/JS`, here `.` is used.
3. `erlc helloWord.erl` will compile the attached [helloWorld.erl](helloWorld.er) file , creating a file called `helloWorld.beam`
4. `erl -noshell -s helloWorld start -s init stop` will run the file.
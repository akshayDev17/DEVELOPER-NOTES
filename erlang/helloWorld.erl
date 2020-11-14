% hello world program
-module(helloWorld). % module name same as file name, hence camel casing
-export([start/0]).
start() ->
io:fwrite("Hello World!!\n").
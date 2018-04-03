function runbash(script)
% Run Bash script
% runbash(script)
% script: script name string
% This function is compatible with the Cygwin and MinGW but not with the WSL.

% FW April 2018

bashcmd = 'D:\cygwin64\bin\bash.exe ';
% bashcmd = 'D:\MinGW\msys\1.0\bin\bash.exe ';

fullpath = which(script);
scriptcmd = ['"' fullpath '"'];

system([bashcmd scriptcmd]);

end

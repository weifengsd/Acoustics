function runbashc(cmd)
% Run Bash cmd
% runbash(cmd)
% cmd: command string
% This function is compatible with the Cygwin and MinGW but not with the WSL.

% FW April 2018

bashcmd = 'D:\cygwin64\bin\bash.exe -c ';
% bashcmd = 'D:\MinGW\msys\1.0\bin\bash.exe -c ';

runcmd = ['"' cmd '"'];

system([bashcmd runcmd]);

end

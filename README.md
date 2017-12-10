# GenerateSFTPChecker
Batch file to generate batch files to check for missing files on an SFTP server.

Needed a simple solution to repeatedly check an external SFTP server for a missing file to become available. This is a regularly occuring problem for me with different files/servers each time. This batch file asks for server name, username, password, etc, and then writes a customized "WaitFor_%filename%.bat" file to run, along with a helper file "WaitFor_%filename%_FTPCommands.txt" to store the FTP commands. The FTP commands are ran through psftp.exe. When the file is found and downloaded, a big red command-prompt popup will be made to get your attention. 

Instructions:
1. Download and install PuTTY https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html
2. Ensure psftp.exe from the PuTTY install is in your PATH
3. Run the batch file, answer the questions
4. Run the generated batch file customized to your answers to begin waiting. Be responsible with your passwords!

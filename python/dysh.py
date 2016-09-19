import cmd
import os
import subprocess 

def run(filename):
	newpid = os.fork()
	if newpid == 0:
		subprocess.call(filename)
		exit(0)
	else:
		os.waitpid(newpid, 0)

def chdir(directory):
			if os.path.exists(directory):
				os.chdir(directory)
				print(os.getcwd())
			else:
				print("Invalid Directory name.")
				
def remove(item):
		x = os.getcwd()
		x = x + "/" + item
		if os.path.exists(x):
			if os.path.isfile(x):
				os.remove(x)
				print("The specfied file has been deleted.")
			else:
				os.rmdir(item)
				print("The specified directory has been deleted.")
		else:
			print("File not found.")

def rename(file):
		x = str(file)
		i = x.split()
		j = os.getcwd()
		j = j + "/" + i[0]
		if os.path.exists(j):
			os.rename(j, i[1])
			print("Filename has been successfully changed.")
		else:
			print("Invalid argument for the Remove command.")

def statement():
	print("Welcome to the DYSH SHELL, enter HELP for a list of commands.\nRemember that commands are case sensitive.")
	print("\n\nYou should have received a copy of the GNU General Public License")
	print("along with this program. If not, see <http://www.gnu.org/licenses/>.")

class Interpreter(cmd.Cmd):

	prompt = '\ndysh> '
	intro = statement()
	
	def do_run(self, filename):
		if filename:
			run(filename)
			print(" ")
		else:
			print("Please specify an (executable-file) to RUN.")
			
	def do_ls(self, directory):
		if directory:
			if os.path.exists(directory):
				j =	os.listdir(directory)
				i = 0
				for i in range(len(j)):
					print(j[i])
					i = i+1
			else:
				print("Invalid amount of arguments for LS command")
				
		else:
			print(os.getcwd())
			print("\n")
			x = os.getcwd()
			j =	os.listdir(x)
			i = 0
			for i in range(len(j)):
				print(j[i])
				i = i+1
	
	def do_chdir(self, directory):
		if directory:
			chdir(directory)
		else:
			print("Please specify a valid directory name.")
		
	def do_rm(self, item):
		if item:
			remove(item)
		else:
			print("Invalid argument for the RM command.")
	
	def do_mv(self, file):
		if file:
			rename(file)
		else:
			print("Specify a SOURCE filename and DESTINATION file name.")
	
	def do_help(self, commands):
		if commands:
			print("I do not understand...Please enter 'help' or try again.")
		else:
			print("The following are commands that are available and their functions.")
			print("and the parameters are in parenthesis.\n")
			print("RUN ./(executable-file) runs an executable file.")
			print("LS lists the contents in current directory.")
			print("LS (../(directory) lists the contents of a specified directory.")
			print("CHDIR (directory) changes current directory to a specified one.")
			print("CHDIR ../ changes the current directory to the parent directory.")
			print("RM (file/directory) deletes a specfied file or directory.")
			print("MV renames files from the original name to a new name.")
			print("HELP shows a list of valid commands.")
			print("QUIT quits the program.")

	def do_quit(self, line):
		print("\nGoodbye. . .\n")
		return True

	def default(self, line):
		print('I do not understand...Please enter help or try again.(%s)' %line)
		return cmd.Cmd.default(self, line)

if __name__ == '__main__':
	Interpreter().cmdloop()


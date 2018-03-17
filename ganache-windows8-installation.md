### Installing Ganache on Windows 8
Here are the steps to follow on Windows 8.

#### Check your prerequisites
You will need to install Git and NodeJS first, so go through the following lesson first, skip the part about Ganache and then come back here.

#### Command prompt
Open a PowerShell window with administrative privileges. To do that, in your start menu, find the Windows PowerShell program, right click it and click “Run as Administrator”.

#### Install Windows Build Tools
You have to install the Windows Build Tools, that include the SDK libraries that will be necessary during the installation of Ganache.
The Windows Build Tools must be installed with the Node package manager:
```
npm install --global --production windows-build-tools
```

The installation process may take several minutes.

#### Clone the repository
The installation of Ganache will be done through its source code.

From your command prompt, go to the parent folder where you want Ganache to be installed:
```
cd <your-folder>
```

Then clone the Ganache repository:

```
git clone https://github.com/trufflesuite/ganache.git
```

#### Install Ganache
The first step is to install all the required dependencies.
Go to the folder created by cloning the github repository in the command above, and then run the following NPM command:

```
cd ganache
npm install
```

The installation process may take several minutes.

#### Run Ganache
At this point, Ganache is ready to start.

Let’s use the following NPM command to start Ganache:
```
npm start
```

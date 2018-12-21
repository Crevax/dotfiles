export WORK_DIR=$HOME/CodeProjects/src

# Golang
export GOROOT=/usr/local/go
export GOPATH=$HOME/CodeProjects
export PATH=$GOPATH/bin:$PATH

# For building Kotlin from the CLI
# Kotlin
export PATH=/opt/kotlinc/bin:$PATH
export PATH=/opt/gradle/gradle-4.6/bin:$PATH

# Java
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_31.jdk/Contents/Home
export PATH=$JAVA_HOME/bin:$PATH

# Install Ruby Gems under the user instead of globally
# See https://guides.cocoapods.org/using/getting-started.html#sudo-less-installation
export GEM_HOME=$HOME/.gem
export PATH=$GEM_HOME/bin:$PATH

# Ensure my personal executables take prescendence over others
export PATH=$HOME/bin:$PATH

# NVM doesn't like it if $PATH is set afterwards
export NVM_DIR=$HOME/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

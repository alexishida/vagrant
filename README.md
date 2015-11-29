Vagrant 
=============

My vagrant


Instalação
-----------

    1 - Plugins Vagrant
         $ vagrant plugin install vagrant-vbguest


    2 - Rode a máquina
        $ vagrant up

    3 - Entre na máquina
        $ vagrant ssh

Gerando a box
----------------

    1 - Limpando a máquina
        $ sudo apt-get clean
        $ sudo dd if=/dev/zero of=/EMPTY bs=1M
        $ sudo rm -f /EMPTY
        $ cat /dev/null > ~/.bash_history && history -c && exit

    2 - Gerando a box nova
        vagrant package --output datadegeracao-default.box    


    A pasta compartilhado do Vagrant é:
        C:/desenvolvimento


Erro
-----
Em caso de erro na criação da máquina

    $ vagrant destroy
    $ vagrant up

Em caso de erro de Hyper-V habilitado favor executar:

    bcdedit /set hypervisorlaunchtype off

Em caso problema de quebra de linha com o GIT no Windows
Execute o comando abaixo no GIT do seu windows:
    
    git config --global core.autocrlf false    
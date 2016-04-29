Vagrant
=============

My vagrant


Itens Instalados
---------------------
    Ubuntu Server 14.04
    Git version (last version)
    Redis server (last version)
    Memcached (last version)
    Postgres 9.4
    Node v6.0.0 (NVM)
    Ruby 2.3.1
    Rails 4.2.6 (RBENV)
	Docker (last version)

Pendentes
---------------------------------------
    JAVA (repositorio parou de funcionar)
        java version "1.8.0_66"
        Java(TM) SE Runtime Environment (build 1.8.0_66-b17)
        Java HotSpot(TM) 64-Bit Server VM (build 25.66-b17, mixed mode)


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

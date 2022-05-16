

# CISCO LAB commands#

################# for Switch and router common config ################
hostname Device_D
enable secret MNB+457KLT
enable password KFT*678RTW
line console 0
password RTM++2GHJ
login
line vty 0 15
password DFW*TYW/XTY
login
service password-encryption
banner motd $Entorno Corporativo privado RED COLOMBIA FABRICA!..$



#################Switch L2################
 #VLAN MANAGEMENT#
vlan 100
interface Vlan100
ip address 70.0.0.4 255.0.0.0

# mode acces port and VLAN to the Ports#
interface fastEthernet 0/22
 description CONECTA A Device_B - VLAN VENTAS
 switchport mode access
 switchport access vlan 21
 
 ###Mode Trunk varias VLAN-> se deben propagar todas ###
 description CONECTA A Device_D - Puerto TRUNK
 switchport mode trunk
 switchport trunk native vlan 999
switchport trunk allowed vlan 21-24,100,999
 no shutdown

switchport trunk native vlan 999
#################Router L3################

#interfaces IP address Description#
interface FastEthernet0/0
 description CONEXION a SW-C - ESTUDIANTES
 ip address 20.0.0.1 255.0.0.0

 encapsultaion dot1Q 6 (numero de vlan para el ejemplo es 6)
 ip address la_ip la_mask
 no shutdown

 # Spanning Tree Protocol#

 panning-tree mode pvst
spanning-tree extend system-id
spanning-tree vlan 1 priority 28672

spanning-tree mode pvst
spanning-tree extend system-id
spanning-tree vlan 1 priority 24576


spanning-tree vlan 21-24,100,999 root  primary 
spanning-tree vlan 21-24,100,999 root  secondary 


no switchport trunk native vlan 999
no switchport trunk allowed vlan 21-24,100,999
switchport mode access
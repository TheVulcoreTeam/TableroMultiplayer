extends Node

const DEFAULT_PORT = 3000
const MAX_CLIENTS = 4

var server
var client

var ip_address := "localhost"

func _ready() -> void:
#	if OS.get_name() == "Windows":
#		ip_address = IP.get_local_addresses()[3]
#	elif OS.get_name() == "Android":
#		ip_address = IP.get_local_addresses()[0]
#	else:
#		ip_address = IP.get_local_addresses()[3]
#
#	print_debug(IP.get_local_addresses())
#
#	for ip in IP.get_local_addresses():
#		if ip.begins_with("192.168."):
#			ip_address = ip
	
	get_tree().connect("connected_to_server", self, "_connected_to_server")
	get_tree().connect("server_disconnected", self, "_server_disconnected")

func create_server() -> void:
	server = NetworkedMultiplayerENet.new()
	server.create_server(DEFAULT_PORT, MAX_CLIENTS)
	get_tree().network_peer = server

func join_server() -> void:
	client = NetworkedMultiplayerENet.new()
	client.create_client(ip_address, DEFAULT_PORT)
	get_tree().network_peer = client

func _connected_to_server() -> void:
	print("Se ha conectado al Server exitosamente.")

func _server_disconnected() -> void:
	print("Se ha desconectado del Server.")
